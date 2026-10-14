import { query, toPublicImageUrl } from '../db.js';

function mapPublicProduct(row, variants = []) {
  const mappedVariants = variants.map((v) => ({
    id: v.id,
    strength: v.strength,
    price: Number(v.price),
    stock: v.stock,
    sku: v.sku || undefined,
  }));

  const prices = mappedVariants.map((v) => v.price);
  const min = prices.length ? Math.min(...prices) : 0;
  const max = prices.length ? Math.max(...prices) : 0;

  let overallStock = 'out_of_stock';
  if (mappedVariants.some((v) => v.stock === 'in_stock')) overallStock = 'in_stock';
  else if (mappedVariants.some((v) => v.stock === 'low')) overallStock = 'low';

  return {
    id: row.id,
    sku: row.sku,
    name: row.name,
    category: row.category,
    status: row.status,
    featured: Boolean(row.featured),
    image: toPublicImageUrl(row.image),
    description: row.description || '',
    purity: row.purity != null ? Number(row.purity) : undefined,
    buyLink: row.buy_link || '',
    variants: mappedVariants,
    price: min,
    priceMin: min,
    priceMax: max,
    stock: overallStock,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}

/** Public catalog — active products only (no auth). */
export async function listPublicProducts(_req, res) {
  try {
    const rows = await query(
      `SELECT * FROM products
       WHERE status = 'active'
       ORDER BY featured DESC, updated_at DESC`
    );

    if (!rows.length) {
      return res.json({ success: true, products: [], categories: [] });
    }

    const ids = rows.map((r) => r.id);
    const placeholders = ids.map(() => '?').join(',');
    const variantRows = await query(
      `SELECT id, product_id, strength, price, stock, sku, sort_order
       FROM product_variants
       WHERE product_id IN (${placeholders})
       ORDER BY sort_order ASC, price ASC`,
      ids
    );

    const variantMap = new Map();
    for (const v of variantRows) {
      const list = variantMap.get(v.product_id) || [];
      list.push(v);
      variantMap.set(v.product_id, list);
    }

    const products = rows.map((row) => mapPublicProduct(row, variantMap.get(row.id) || []));
    const categories = [...new Set(products.map((p) => p.category))].sort();

    return res.json({ success: true, products, categories });
  } catch (err) {
    console.error('listPublicProducts error:', err);
    return res.status(500).json({ success: false, message: 'Failed to load catalog' });
  }
}
