/**
 * Optional sample products seed.
 * Run: npm run seed
 */
import { v4 as uuidv4 } from 'uuid';
import { initDb, query, queryOne, withTransaction, nowSql } from './db.js';

const samples = [
  {
    sku: 'AOD960',
    name: 'AOD9604',
    category: 'GLP-1 & Metabolic',
    status: 'active',
    featured: 1,
    description: 'Modified fragment of human growth hormone (hGH 176-191).',
    purity: 99.4,
    variants: [
      { strength: '5mg', price: 101, stock: 'in_stock', sku: 'AOD5' },
      { strength: '10mg', price: 135, stock: 'in_stock', sku: 'AOD10' },
    ],
  },
  {
    sku: 'BPC157',
    name: 'BPC-157',
    category: 'Tissue Repair & Recovery',
    status: 'active',
    featured: 1,
    description: 'Body Protection Compound 157 pentadecapeptide.',
    purity: 99.7,
    variants: [
      { strength: '5mg', price: 58, stock: 'in_stock', sku: 'BPC5' },
      { strength: '10mg', price: 95, stock: 'in_stock', sku: 'BPC10' },
    ],
  },
  {
    sku: 'TRZ',
    name: 'Tirzepatide',
    category: 'GLP-1 & Metabolic',
    status: 'active',
    featured: 1,
    description: 'Dual GIP and GLP-1 receptor agonist peptide.',
    purity: 99.7,
    variants: [
      { strength: '10mg', price: 140, stock: 'in_stock', sku: 'TRZ10' },
      { strength: '15mg', price: 190, stock: 'in_stock', sku: 'TRZ15' },
      { strength: '30mg', price: 320, stock: 'low', sku: 'TRZ30' },
    ],
  },
];

async function main() {
  await initDb();

  const existing = await queryOne('SELECT COUNT(*) AS c FROM products');
  if (Number(existing.c) > 0) {
    console.log(`Catalog already has ${existing.c} products. Skipping seed.`);
    process.exit(0);
  }

  const now = nowSql();

  await withTransaction(async (conn) => {
    for (const p of samples) {
      const id = `prod-${uuidv4()}`;
      await conn.execute(
        `INSERT INTO products
          (id, sku, name, category, status, featured, image, description, purity, created_at, updated_at)
         VALUES (?, ?, ?, ?, ?, ?, NULL, ?, ?, ?, ?)`,
        [
          id,
          p.sku,
          p.name,
          p.category,
          p.status,
          p.featured,
          p.description,
          p.purity,
          now,
          now,
        ]
      );

      for (let i = 0; i < p.variants.length; i++) {
        const v = p.variants[i];
        await conn.execute(
          `INSERT INTO product_variants
            (id, product_id, strength, price, stock, sku, sort_order)
           VALUES (?, ?, ?, ?, ?, ?, ?)`,
          [`var-${uuidv4()}`, id, v.strength, v.price, v.stock, v.sku, i]
        );
      }
    }
  });

  console.log(`Seeded ${samples.length} sample products into MySQL.`);
  process.exit(0);
}

main().catch((err) => {
  console.error('Seed failed:', err.message);
  process.exit(1);
});
