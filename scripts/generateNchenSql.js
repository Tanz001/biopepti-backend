/**
 * Builds SQL insert from biopepti-leanbloom/src/data/products.ts
 * (NCHEN.pdf wholesale kit list) with prices = PDF × 1.45
 */
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, '../..');
const productsTs = path.join(root, 'biopepti-leanbloom/src/data/products.ts');
const outSql = path.join(root, 'backend/sql/insert_nchen_catalog.sql');

const src = fs.readFileSync(productsTs, 'utf8');
const re =
  /\{\s*id:\s*'[^']+',\s*sku:\s*'([^']+)',\s*name:\s*'([^']+)',\s*spec:\s*'([^']+)',\s*price:\s*(\d+(?:\.\d+)?),\s*category:\s*'([^']+)',\s*purity:\s*'([^']+)',\s*description:\s*'([^']*)'/g;

const rows = [];
let m;
while ((m = re.exec(src))) {
  rows.push({
    sku: m[1],
    name: m[2],
    spec: m[3],
    price: Number(m[4]),
    category: m[5],
    purity: m[6],
    description: m[7],
  });
}

if (rows.length === 0) {
  console.error('No products parsed from', productsTs);
  process.exit(1);
}

function esc(s) {
  return String(s).replace(/\\/g, '\\\\').replace(/'/g, "''");
}

function slug(name) {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '');
}

function baseSku(name, variants) {
  const first = variants[0].sku;
  // e.g. TR5→TR, 5AD→AD, SMK30→SMK
  const prefix = first
    .replace(/^\d+/, '')
    .replace(/\d+$/, '')
    .replace(/[-_]+$/g, '');
  if (prefix && prefix.length >= 2 && /[A-Za-z]/.test(prefix)) {
    return prefix.toUpperCase();
  }
  return name.replace(/[^A-Za-z0-9]/g, '').toUpperCase().slice(0, 16);
}

function markup(p) {
  return Math.round(p * 1.45 * 100) / 100;
}

function purityNum(p) {
  const n = parseFloat(String(p).replace(/[^0-9.]/g, ''));
  return Number.isFinite(n) ? n : 99.0;
}

const groups = new Map();
for (const r of rows) {
  if (!groups.has(r.name)) groups.set(r.name, []);
  groups.get(r.name).push(r);
}

const featured = new Set([
  'Tirzepatide',
  'Retatrutide',
  'Semaglutide',
  'BPC-157',
  'TB-500',
  'GHK-Cu',
  'Cagrilintide',
  'AOD9604',
  'Ipamorelin',
]);

const now = new Date().toISOString().slice(0, 19).replace('T', ' ');
const sql = [];

sql.push('-- ============================================================');
sql.push('-- Biopepti catalog from NCHEN.pdf wholesale kit list');
sql.push('-- Source: biopepti-leanbloom/src/data/products.ts');
sql.push('-- Price rule: sell_price = ROUND(pdf_price * 1.45, 2)');
sql.push(`-- Generated: ${now}`);
sql.push(`-- Products: ${groups.size} | Variants/sizes: ${rows.length}`);
sql.push('-- Run in MySQL Workbench against your Biopepti database.');
sql.push('-- WARNING: deletes existing products + variants first.');
sql.push('-- ============================================================');
sql.push('');
sql.push('SET NAMES utf8mb4;');
sql.push('SET FOREIGN_KEY_CHECKS = 0;');
sql.push('');
sql.push('DELETE FROM product_variants;');
sql.push('DELETE FROM products;');
sql.push('');
sql.push('SET FOREIGN_KEY_CHECKS = 1;');
sql.push('');

const usedProductSkus = new Set();
let pi = 0;

for (const [name, variants] of groups) {
  pi += 1;
  let pSku = baseSku(name, variants);
  if (usedProductSkus.has(pSku)) pSku = `${pSku}${pi}`;
  usedProductSkus.add(pSku);

  const pid = `prod-${slug(name)}`;
  const v0 = variants[0];
  const isFeat = featured.has(name) ? 1 : 0;

  sql.push(`-- ${name} (${variants.length} sizes)`);
  sql.push(
    'INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES'
  );
  sql.push(
    `  ('${pid}', '${esc(pSku)}', '${esc(name)}', '${esc(v0.category)}', 'active', ${isFeat}, NULL, '${esc(v0.description)}', ${purityNum(v0.purity)}, NULL, '${now}', '${now}');`
  );
  sql.push(
    'INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES'
  );

  const vals = variants.map((v, i) => {
    const price = markup(v.price).toFixed(2);
    const vid = `var-${v.sku.toLowerCase().replace(/[^a-z0-9]+/g, '-')}`;
    return `  ('${vid}', '${pid}', '${esc(v.spec)}', ${price}, 'in_stock', '${esc(v.sku)}', ${i})`;
  });
  sql.push(`${vals.join(',\n')};`);
  sql.push('');
}

sql.push('-- Verify counts');
sql.push('SELECT COUNT(*) AS products FROM products;');
sql.push('SELECT COUNT(*) AS variants FROM product_variants;');
sql.push(
  'SELECT p.name, v.sku, v.strength, v.price FROM products p JOIN product_variants v ON v.product_id = p.id ORDER BY p.name, v.sort_order LIMIT 25;'
);

fs.mkdirSync(path.dirname(outSql), { recursive: true });
fs.writeFileSync(outSql, sql.join('\n'), 'utf8');

console.log(`Wrote ${outSql}`);
console.log(`Products: ${groups.size}, variants: ${rows.length}`);
console.log('Sample markup: Tirzepatide 5mg PDF $30 → $' + markup(30).toFixed(2));
console.log('Sample markup: Tirzepatide 10mg PDF $45 → $' + markup(45).toFixed(2));
