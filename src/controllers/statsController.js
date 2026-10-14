import { query, queryOne, toPublicImageUrl } from '../db.js';

export async function getStats(_req, res) {
  try {
    const total = (await queryOne('SELECT COUNT(*) AS c FROM products')).c;
    const active = (
      await queryOne(`SELECT COUNT(*) AS c FROM products WHERE status = 'active'`)
    ).c;
    const draft = (
      await queryOne(`SELECT COUNT(*) AS c FROM products WHERE status = 'draft'`)
    ).c;
    const categoriesCount = (
      await queryOne(`SELECT COUNT(DISTINCT category) AS c FROM products`)
    ).c;
    const variantsCount = (
      await queryOne('SELECT COUNT(*) AS c FROM product_variants')
    ).c;

    const outOfStock = (
      await queryOne(
        `SELECT COUNT(*) AS c FROM products p
         WHERE NOT EXISTS (
           SELECT 1 FROM product_variants v
           WHERE v.product_id = p.id AND v.stock IN ('in_stock', 'low')
         )
         AND EXISTS (
           SELECT 1 FROM product_variants v2 WHERE v2.product_id = p.id
         )`
      )
    ).c;

    const recentRows = await query(
      `SELECT id, sku, name, category, status, image, updated_at
       FROM products
       ORDER BY updated_at DESC
       LIMIT 5`
    );

    const recentProducts = [];
    for (const p of recentRows) {
      const variants = await query(
        `SELECT strength, price, stock FROM product_variants
         WHERE product_id = ? ORDER BY sort_order ASC, price ASC`,
        [p.id]
      );
      recentProducts.push({
        id: p.id,
        sku: p.sku,
        name: p.name,
        category: p.category,
        status: p.status,
        image: toPublicImageUrl(p.image),
        updatedAt: p.updated_at,
        variants: variants.map((v) => ({
          ...v,
          price: Number(v.price),
        })),
      });
    }

    return res.json({
      success: true,
      stats: {
        total: Number(total),
        active: Number(active),
        draft: Number(draft),
        outOfStock: Number(outOfStock),
        categoriesCount: Number(categoriesCount),
        variantsCount: Number(variantsCount),
      },
      recentProducts,
    });
  } catch (err) {
    console.error('getStats error:', err);
    return res.status(500).json({ success: false, message: 'Failed to load stats' });
  }
}
