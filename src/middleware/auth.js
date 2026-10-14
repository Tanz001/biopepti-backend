import jwt from 'jsonwebtoken';
import { queryOne } from '../db.js';

export async function requireAuth(req, res, next) {
  const header = req.headers.authorization || '';
  const token = header.startsWith('Bearer ') ? header.slice(7) : null;

  if (!token) {
    return res.status(401).json({ success: false, message: 'Authentication required' });
  }

  try {
    const payload = jwt.verify(token, process.env.JWT_SECRET || 'biopepti-dev-secret');
    const admin = await queryOne(
      `SELECT id, name, email, role, initials, created_at, updated_at
       FROM admins WHERE id = ?`,
      [payload.sub]
    );

    if (!admin) {
      return res.status(401).json({ success: false, message: 'Invalid token' });
    }

    req.admin = admin;
    next();
  } catch {
    return res.status(401).json({ success: false, message: 'Invalid or expired token' });
  }
}
