import mysql from 'mysql2/promise';
import bcrypt from 'bcryptjs';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const rootDir = path.resolve(__dirname, '..');
const uploadsDir = path.join(rootDir, 'uploads');

if (!fs.existsSync(uploadsDir)) fs.mkdirSync(uploadsDir, { recursive: true });

/** @type {mysql.Pool | null} */
let pool = null;

export function getPool() {
  if (!pool) {
    throw new Error('Database not initialized. Call initDb() first.');
  }
  return pool;
}

export async function query(sql, params = []) {
  const [rows] = await getPool().execute(sql, params);
  return rows;
}

export async function queryOne(sql, params = []) {
  const rows = await query(sql, params);
  return rows[0] || null;
}

export async function withTransaction(fn) {
  const connection = await getPool().getConnection();
  try {
    await connection.beginTransaction();
    const result = await fn(connection);
    await connection.commit();
    return result;
  } catch (err) {
    await connection.rollback();
    throw err;
  } finally {
    connection.release();
  }
}

async function ensureDatabaseExists() {
  const host = process.env.DB_HOST || 'localhost';
  const port = Number(process.env.DB_PORT) || 3306;
  const user = process.env.DB_USER || 'root';
  const password = process.env.DB_PASSWORD || '';
  const database = process.env.DB_NAME || 'biopepti';

  const bootstrap = await mysql.createConnection({
    host,
    port,
    user,
    password,
    multipleStatements: true,
  });

  await bootstrap.query(
    `CREATE DATABASE IF NOT EXISTS \`${database}\`
     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci`
  );
  await bootstrap.end();

  return { host, port, user, password, database };
}

export async function initDb() {
  const config = await ensureDatabaseExists();

  pool = mysql.createPool({
    host: config.host,
    port: config.port,
    user: config.user,
    password: config.password,
    database: config.database,
    waitForConnections: true,
    connectionLimit: 10,
    namedPlaceholders: false,
    dateStrings: true,
  });

  await query(`
    CREATE TABLE IF NOT EXISTS admins (
      id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(120) NOT NULL,
      email VARCHAR(190) NOT NULL,
      password_hash VARCHAR(255) NOT NULL,
      role VARCHAR(80) NOT NULL DEFAULT 'Store Admin',
      initials VARCHAR(8) NOT NULL DEFAULT 'AD',
      created_at DATETIME NOT NULL,
      updated_at DATETIME NOT NULL,
      UNIQUE KEY uq_admins_email (email)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
  `);

  await query(`
    CREATE TABLE IF NOT EXISTS products (
      id VARCHAR(64) NOT NULL PRIMARY KEY,
      sku VARCHAR(64) NOT NULL,
      name VARCHAR(190) NOT NULL,
      category VARCHAR(120) NOT NULL,
      status ENUM('active', 'draft') NOT NULL DEFAULT 'active',
      featured TINYINT(1) NOT NULL DEFAULT 0,
      image VARCHAR(255) NULL,
      description TEXT NULL,
      purity DECIMAL(5,2) NULL,
      buy_link VARCHAR(500) NULL,
      created_at DATETIME NOT NULL,
      updated_at DATETIME NOT NULL,
      UNIQUE KEY uq_products_sku (sku),
      KEY idx_products_status (status),
      KEY idx_products_category (category)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
  `);

  // Existing DBs created before buy_link — add column safely
  try {
    await query(`ALTER TABLE products ADD COLUMN buy_link VARCHAR(500) NULL`);
  } catch (err) {
    if (!String(err.message || '').includes('Duplicate column')) {
      console.warn('buy_link migration:', err.message);
    }
  }

  await query(`
    CREATE TABLE IF NOT EXISTS product_variants (
      id VARCHAR(64) NOT NULL PRIMARY KEY,
      product_id VARCHAR(64) NOT NULL,
      strength VARCHAR(64) NOT NULL,
      price DECIMAL(12,2) NOT NULL,
      stock ENUM('in_stock', 'low', 'out_of_stock') NOT NULL DEFAULT 'in_stock',
      sku VARCHAR(64) NULL,
      sort_order INT NOT NULL DEFAULT 0,
      KEY idx_variants_product (product_id),
      CONSTRAINT fk_variants_product
        FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
  `);

  await ensureDefaultAdmin();

  console.log(
    `MySQL connected: ${config.user}@${config.host}:${config.port}/${config.database}`
  );
  return pool;
}

async function ensureDefaultAdmin() {
  const existing = await queryOne('SELECT id FROM admins LIMIT 1');
  if (existing) return;

  const now = new Date().toISOString().slice(0, 19).replace('T', ' ');
  const email = process.env.ADMIN_EMAIL || 'admin@biopepti.com';
  const password = process.env.ADMIN_PASSWORD || 'admin123';
  const name = process.env.ADMIN_NAME || 'Admin';
  const parts = name.trim().split(/\s+/).filter(Boolean);
  const initials =
    parts.length > 1
      ? `${parts[0][0]}${parts[1][0]}`.toUpperCase()
      : (parts[0] || 'AD').substring(0, 2).toUpperCase();

  const passwordHash = bcrypt.hashSync(password, 10);

  await query(
    `INSERT INTO admins (name, email, password_hash, role, initials, created_at, updated_at)
     VALUES (?, ?, ?, ?, ?, ?, ?)`,
    [name, email, passwordHash, 'Store Admin', initials, now, now]
  );

  console.log(`Default admin created: ${email} / ${password}`);
}

export function getUploadsDir() {
  return uploadsDir;
}

export function toPublicImageUrl(filename) {
  if (!filename) return null;
  if (
    filename.startsWith('http://') ||
    filename.startsWith('https://') ||
    filename.startsWith('data:')
  ) {
    return filename;
  }
  return `/uploads/${filename}`;
}

export function nowSql() {
  return new Date().toISOString().slice(0, 19).replace('T', ' ');
}

export default { getPool, query, queryOne, withTransaction, initDb };
