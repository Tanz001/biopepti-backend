import multer from 'multer';
import path from 'path';
import { v4 as uuidv4 } from 'uuid';
import { getUploadsDir } from '../db.js';

const ALLOWED = new Set(['.jpg', '.jpeg', '.png', '.webp', '.gif', '.svg']);

const storage = multer.diskStorage({
  destination(_req, _file, cb) {
    cb(null, getUploadsDir());
  },
  filename(_req, file, cb) {
    const ext = path.extname(file.originalname).toLowerCase() || '.jpg';
    cb(null, `product-${uuidv4()}${ext}`);
  },
});

function fileFilter(_req, file, cb) {
  const ext = path.extname(file.originalname).toLowerCase();
  if (!ALLOWED.has(ext)) {
    return cb(new Error('Only image files are allowed (jpg, png, webp, gif, svg)'));
  }
  cb(null, true);
}

export const uploadProductImage = multer({
  storage,
  fileFilter,
  limits: { fileSize: 5 * 1024 * 1024 }, // 5MB
}).single('image');
