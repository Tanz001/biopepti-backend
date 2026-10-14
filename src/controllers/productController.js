import fs from 'fs';
import path from 'path';
import { v4 as uuidv4 } from 'uuid';
import {
  query,
  queryOne,
  withTransaction,
  getUploadsDir,
  toPublicImageUrl,
  nowSql,
} from '../db.js';

function mapProduct(row, variants = []) {
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
    spec: mappedVariants.map((v) => v.strength).join(' / '),
    stock: overallStock,
    priceMin: min,
    priceMax: max,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}

async function getVariantsForProduct(productId, connection = null) {
  const sql = `SELECT id, product_id, strength, price, stock, sku, sort_order
               FROM product_variants
               WHERE product_id = ?
               ORDER BY sort_order ASC, price ASC`;
  if (connection) {
    const [rows] = await connection.execute(sql, [productId]);
    return rows;
  }
  return query(sql, [productId]);
}

async function getVariantsForProducts(productIds) {
  if (!productIds.length) return new Map();
  const placeholders = productIds.map(() => '?').join(',');
  const rows = await query(
    `SELECT id, product_id, strength, price, stock, sku, sort_order
     FROM product_variants
     WHERE product_id IN (${placeholders})
     ORDER BY sort_order ASC, price ASC`,
    productIds
  );

  const map = new Map();
  for (const row of rows) {
    const list = map.get(row.product_id) || [];
    list.push(row);
    map.set(row.product_id, list);
  }
  return map;
}

function parseVariants(raw) {
  let variants = raw;
  if (typeof raw === 'string') {
    try {
      variants = JSON.parse(raw);
    } catch {
      throw new Error('Variants must be valid JSON');
    }
  }
  if (!Array.isArray(variants) || variants.length === 0) {
    throw new Error('Add at least one strength / price variant');
  }

  return variants.map((v, index) => {
    const strength = String(v.strength || '').trim();
    const price = Number(v.price);
    const stock = ['in_stock', 'low', 'out_of_stock'].includes(v.stock)
      ? v.stock
      : 'in_stock';
    const sku = v.sku ? String(v.sku).trim() : null;

    if (!strength) throw new Error(`Variant ${index + 1}: strength is required`);
    if (!Number.isFinite(price) || price <= 0) {
      throw new Error(`Variant ${index + 1}: price must be greater than 0`);
    }

    return {
      id: v.id || `var-${uuidv4()}`,
      strength,
      price,
      stock,
      sku,
      sort_order: index,
    };
  });
}

function deleteImageFile(imageValue) {
  if (!imageValue) return;
  if (imageValue.startsWith('http') || imageValue.startsWith('data:')) return;
  const filename = imageValue.replace(/^\/uploads\//, '');
  const full = path.join(getUploadsDir(), filename);
  if (fs.existsSync(full)) {
    try {
      fs.unlinkSync(full);
    } catch (err) {
      console.error('Failed to delete image file:', err.message);
    }
  }
}

export async function listProducts(req, res) {
  try {
    const {
      search = '',
      category = 'all',
      status = 'all',
      sortBy = 'newest',
      page = '1',
      pageSize = '50',
    } = req.query;

    let sql = `SELECT * FROM products WHERE 1=1`;
    const params = [];

    if (String(search).trim()) {
      sql += ` AND (
        name LIKE ? OR sku LIKE ? OR IFNULL(description,'') LIKE ? OR id IN (
          SELECT product_id FROM product_variants
          WHERE strength LIKE ? OR IFNULL(sku,'') LIKE ?
        )
      )`;
      const q = `%${String(search).trim()}%`;
      params.push(q, q, q, q, q);
    }

    if (category && category !== 'all') {
      sql += ` AND category = ?`;
      params.push(category);
    }

    if (status && status !== 'all') {
      if (status === 'out_of_stock') {
        sql += ` AND id NOT IN (
          SELECT product_id FROM product_variants WHERE stock IN ('in_stock', 'low')
        )`;
      } else {
        sql += ` AND status = ?`;
        params.push(status);
      }
    }

    switch (sortBy) {
      case 'name-asc':
        sql += ` ORDER BY name ASC`;
        break;
      case 'price-asc':
        sql += ` ORDER BY (
          SELECT MIN(price) FROM product_variants WHERE product_id = products.id
        ) ASC`;
        break;
      case 'price-desc':
        sql += ` ORDER BY (
          SELECT MIN(price) FROM product_variants WHERE product_id = products.id
        ) DESC`;
        break;
      case 'newest':
      default:
        sql += ` ORDER BY created_at DESC`;
        break;
    }

    const allRows = await query(sql, params);
    const pageNum = Math.max(1, parseInt(page, 10) || 1);
    const size = Math.min(100, Math.max(1, parseInt(pageSize, 10) || 50));
    const total = allRows.length;
    const start = (pageNum - 1) * size;
    const pageRows = allRows.slice(start, start + size);

    const variantMap = await getVariantsForProducts(pageRows.map((r) => r.id));
    const products = pageRows.map((row) => mapProduct(row, variantMap.get(row.id) || []));

    const categoryRows = await query(
      `SELECT DISTINCT category FROM products ORDER BY category ASC`
    );

    return res.json({
      success: true,
      products,
      categories: categoryRows.map((r) => r.category),
      pagination: {
        page: pageNum,
        pageSize: size,
        total,
        totalPages: Math.max(1, Math.ceil(total / size)),
      },
    });
  } catch (err) {
    console.error('listProducts error:', err);
    return res.status(500).json({ success: false, message: 'Failed to load products' });
  }
}

export async function getProduct(req, res) {
  try {
    const row = await queryOne('SELECT * FROM products WHERE id = ?', [req.params.id]);
    if (!row) {
      return res.status(404).json({ success: false, message: 'Product not found' });
    }
    const variants = await getVariantsForProduct(row.id);
    return res.json({ success: true, product: mapProduct(row, variants) });
  } catch (err) {
    console.error('getProduct error:', err);
    return res.status(500).json({ success: false, message: 'Failed to load product' });
  }
}

export async function createProduct(req, res) {
  try {
    const name = String(req.body.name || '').trim();
    const sku = String(req.body.sku || '')
      .trim()
      .toUpperCase();
    const category = String(req.body.category || '').trim();
    const description = String(req.body.description || '').trim();
    const status = req.body.status === 'draft' ? 'draft' : 'active';
    const featured =
      req.body.featured === true || req.body.featured === 'true' || req.body.featured === '1';
    const purity =
      req.body.purity != null && req.body.purity !== '' ? Number(req.body.purity) : null;
    const buyLink = String(req.body.buyLink || req.body.buy_link || '').trim() || null;

    if (!name || name.length < 2) {
      return res.status(400).json({ success: false, message: 'Product name is required' });
    }
    if (!sku || sku.length < 2) {
      return res.status(400).json({ success: false, message: 'SKU is required' });
    }
    if (!category) {
      return res.status(400).json({ success: false, message: 'Category is required' });
    }

    let variants;
    try {
      variants = parseVariants(req.body.variants);
    } catch (e) {
      return res.status(400).json({ success: false, message: e.message });
    }

    const existing = await queryOne(
      'SELECT id FROM products WHERE LOWER(sku) = ?',
      [sku.toLowerCase()]
    );
    if (existing) {
      return res.status(409).json({ success: false, message: `SKU "${sku}" is already in use` });
    }

    const id = `prod-${uuidv4()}`;
    const now = nowSql();
    const image = req.file ? req.file.filename : req.body.image || null;

    await withTransaction(async (conn) => {
      await conn.execute(
        `INSERT INTO products
          (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
          id,
          sku,
          name,
          category,
          status,
          featured ? 1 : 0,
          image,
          description || null,
          purity,
          buyLink,
          now,
          now,
        ]
      );

      for (const v of variants) {
        await conn.execute(
          `INSERT INTO product_variants
            (id, product_id, strength, price, stock, sku, sort_order)
           VALUES (?, ?, ?, ?, ?, ?, ?)`,
          [v.id, id, v.strength, v.price, v.stock, v.sku, v.sort_order]
        );
      }
    });

    const row = await queryOne('SELECT * FROM products WHERE id = ?', [id]);
    const savedVariants = await getVariantsForProduct(id);
    return res.status(201).json({ success: true, product: mapProduct(row, savedVariants) });
  } catch (err) {
    console.error('createProduct error:', err);
    if (req.file) deleteImageFile(req.file.filename);
    return res
      .status(500)
      .json({ success: false, message: err.message || 'Failed to create product' });
  }
}

export async function updateProduct(req, res) {
  try {
    const existing = await queryOne('SELECT * FROM products WHERE id = ?', [req.params.id]);
    if (!existing) {
      return res.status(404).json({ success: false, message: 'Product not found' });
    }

    const name = req.body.name != null ? String(req.body.name).trim() : existing.name;
    const sku =
      req.body.sku != null ? String(req.body.sku).trim().toUpperCase() : existing.sku;
    const category =
      req.body.category != null ? String(req.body.category).trim() : existing.category;
    const description =
      req.body.description != null
        ? String(req.body.description).trim()
        : existing.description;
    const status =
      req.body.status != null
        ? req.body.status === 'draft'
          ? 'draft'
          : 'active'
        : existing.status;
    const featured =
      req.body.featured != null
        ? req.body.featured === true ||
          req.body.featured === 'true' ||
          req.body.featured === '1'
        : Boolean(existing.featured);
    const purity =
      req.body.purity != null && req.body.purity !== ''
        ? Number(req.body.purity)
        : existing.purity;
    const buyLink =
      req.body.buyLink != null || req.body.buy_link != null
        ? String(req.body.buyLink || req.body.buy_link || '').trim() || null
        : existing.buy_link;

    if (!name || !sku || !category) {
      return res
        .status(400)
        .json({ success: false, message: 'Name, SKU, and category are required' });
    }

    const skuConflict = await queryOne(
      'SELECT id FROM products WHERE LOWER(sku) = ? AND id != ?',
      [sku.toLowerCase(), existing.id]
    );
    if (skuConflict) {
      return res.status(409).json({ success: false, message: `SKU "${sku}" is already in use` });
    }

    let variants = null;
    if (req.body.variants != null) {
      try {
        variants = parseVariants(req.body.variants);
      } catch (e) {
        return res.status(400).json({ success: false, message: e.message });
      }
    }

    let image = existing.image;
    if (req.file) {
      deleteImageFile(existing.image);
      image = req.file.filename;
    } else if (req.body.image !== undefined && req.body.image !== null && req.body.image !== '') {
      image = String(req.body.image);
    }

    const now = nowSql();

    await withTransaction(async (conn) => {
      await conn.execute(
        `UPDATE products
         SET sku = ?, name = ?, category = ?, status = ?, featured = ?, image = ?,
             description = ?, purity = ?, buy_link = ?, updated_at = ?
         WHERE id = ?`,
        [
          sku,
          name,
          category,
          status,
          featured ? 1 : 0,
          image,
          description || null,
          purity,
          buyLink,
          now,
          existing.id,
        ]
      );

      if (variants) {
        await conn.execute('DELETE FROM product_variants WHERE product_id = ?', [existing.id]);
        for (const v of variants) {
          await conn.execute(
            `INSERT INTO product_variants
              (id, product_id, strength, price, stock, sku, sort_order)
             VALUES (?, ?, ?, ?, ?, ?, ?)`,
            [v.id, existing.id, v.strength, v.price, v.stock, v.sku, v.sort_order]
          );
        }
      }
    });

    const row = await queryOne('SELECT * FROM products WHERE id = ?', [existing.id]);
    const savedVariants = await getVariantsForProduct(existing.id);
    return res.json({ success: true, product: mapProduct(row, savedVariants) });
  } catch (err) {
    console.error('updateProduct error:', err);
    return res
      .status(500)
      .json({ success: false, message: err.message || 'Failed to update product' });
  }
}

export async function deleteProduct(req, res) {
  try {
    const existing = await queryOne('SELECT * FROM products WHERE id = ?', [req.params.id]);
    if (!existing) {
      return res.status(404).json({ success: false, message: 'Product not found' });
    }

    await query('DELETE FROM products WHERE id = ?', [existing.id]);
    deleteImageFile(existing.image);

    return res.json({ success: true, message: 'Product deleted' });
  } catch (err) {
    console.error('deleteProduct error:', err);
    return res.status(500).json({ success: false, message: 'Failed to delete product' });
  }
}

export async function uploadImage(req, res) {
  try {
    if (!req.file) {
      return res.status(400).json({ success: false, message: 'No image file uploaded' });
    }

    const existing = await queryOne('SELECT * FROM products WHERE id = ?', [req.params.id]);
    if (!existing) {
      deleteImageFile(req.file.filename);
      return res.status(404).json({ success: false, message: 'Product not found' });
    }

    deleteImageFile(existing.image);
    await query('UPDATE products SET image = ?, updated_at = ? WHERE id = ?', [
      req.file.filename,
      nowSql(),
      existing.id,
    ]);

    return res.json({
      success: true,
      image: toPublicImageUrl(req.file.filename),
      filename: req.file.filename,
    });
  } catch (err) {
    console.error('uploadImage error:', err);
    return res.status(500).json({ success: false, message: 'Failed to upload image' });
  }
}
