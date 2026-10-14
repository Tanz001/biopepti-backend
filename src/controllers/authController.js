import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { query, queryOne, nowSql } from '../db.js';

function publicAdmin(admin) {
  return {
    id: admin.id,
    name: admin.name,
    email: admin.email,
    role: admin.role,
    initials: admin.initials,
    createdAt: admin.created_at,
    updatedAt: admin.updated_at,
  };
}

function makeToken(admin) {
  return jwt.sign(
    { sub: admin.id, email: admin.email },
    process.env.JWT_SECRET || 'biopepti-dev-secret',
    { expiresIn: '7d' }
  );
}

function getInitials(name) {
  const parts = String(name || '')
    .trim()
    .split(/\s+/)
    .filter(Boolean);
  if (parts.length === 0) return 'AD';
  if (parts.length === 1) return parts[0].substring(0, 2).toUpperCase();
  return `${parts[0][0]}${parts[1][0]}`.toUpperCase();
}

export async function login(req, res) {
  try {
    const email = String(req.body.email || '')
      .trim()
      .toLowerCase();
    const password = String(req.body.password || '');

    if (!email || !password) {
      return res.status(400).json({ success: false, message: 'Email and password are required' });
    }

    const admin = await queryOne('SELECT * FROM admins WHERE LOWER(email) = ?', [email]);
    if (!admin || !bcrypt.compareSync(password, admin.password_hash)) {
      return res.status(401).json({ success: false, message: 'Invalid email or password' });
    }

    return res.json({
      success: true,
      token: makeToken(admin),
      user: publicAdmin(admin),
    });
  } catch (err) {
    console.error('login error:', err);
    return res.status(500).json({ success: false, message: 'Login failed' });
  }
}

export function me(req, res) {
  return res.json({ success: true, user: publicAdmin(req.admin) });
}

export async function updateProfile(req, res) {
  try {
    const name = String(req.body.name || '').trim();
    const email = String(req.body.email || '')
      .trim()
      .toLowerCase();
    const role = String(req.body.role || req.admin.role || 'Store Admin').trim();

    if (!name || !email) {
      return res.status(400).json({ success: false, message: 'Name and email are required' });
    }

    const conflict = await queryOne(
      'SELECT id FROM admins WHERE LOWER(email) = ? AND id != ?',
      [email, req.admin.id]
    );
    if (conflict) {
      return res.status(409).json({ success: false, message: 'Email is already in use' });
    }

    const initials = getInitials(name);
    await query(
      `UPDATE admins
       SET name = ?, email = ?, role = ?, initials = ?, updated_at = ?
       WHERE id = ?`,
      [name, email, role, initials, nowSql(), req.admin.id]
    );

    const updated = await queryOne(
      `SELECT id, name, email, role, initials, created_at, updated_at
       FROM admins WHERE id = ?`,
      [req.admin.id]
    );

    return res.json({ success: true, user: publicAdmin(updated) });
  } catch (err) {
    console.error('updateProfile error:', err);
    return res.status(500).json({ success: false, message: 'Could not update profile' });
  }
}

export async function changePassword(req, res) {
  try {
    const currentPassword = String(req.body.currentPassword || '');
    const newPassword = String(req.body.newPassword || '');

    if (!currentPassword || !newPassword) {
      return res
        .status(400)
        .json({ success: false, message: 'Current and new password are required' });
    }
    if (newPassword.length < 6) {
      return res
        .status(400)
        .json({ success: false, message: 'New password must be at least 6 characters' });
    }

    const admin = await queryOne('SELECT * FROM admins WHERE id = ?', [req.admin.id]);
    if (!admin || !bcrypt.compareSync(currentPassword, admin.password_hash)) {
      return res.status(401).json({ success: false, message: 'Current password is incorrect' });
    }

    const hash = bcrypt.hashSync(newPassword, 10);
    await query('UPDATE admins SET password_hash = ?, updated_at = ? WHERE id = ?', [
      hash,
      nowSql(),
      req.admin.id,
    ]);

    return res.json({ success: true, message: 'Password updated' });
  } catch (err) {
    console.error('changePassword error:', err);
    return res.status(500).json({ success: false, message: 'Could not change password' });
  }
}
