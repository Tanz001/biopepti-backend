import express from 'express';
import cors from 'cors';
import multer from 'multer';
import dotenv from 'dotenv';

import { initDb, getUploadsDir } from './db.js';
import authRoutes from './routes/authRoutes.js';
import productRoutes from './routes/productRoutes.js';
import statsRoutes from './routes/statsRoutes.js';
import publicRoutes from './routes/publicRoutes.js';

dotenv.config();

const app = express();
const PORT = Number(process.env.PORT) || 4000;

app.use(cors({ origin: true, credentials: true }));
app.use(express.json({ limit: '2mb' }));
app.use(express.urlencoded({ extended: true }));

app.use('/uploads', express.static(getUploadsDir()));

app.get('/api/health', (_req, res) => {
  res.json({ success: true, message: 'Biopepti API is running', db: 'mysql' });
});

app.use('/api/auth', authRoutes);
app.use('/api/products', productRoutes);
app.use('/api/stats', statsRoutes);
app.use('/api/public', publicRoutes);

app.use((err, _req, res, _next) => {
  if (err instanceof multer.MulterError || (err.message && /image|file/i.test(err.message))) {
    return res.status(400).json({ success: false, message: err.message });
  }
  console.error('Unhandled error:', err);
  return res.status(500).json({ success: false, message: err.message || 'Server error' });
});

async function start() {
  try {
    await initDb();
    app.listen(PORT, () => {
      console.log(`Biopepti backend listening on http://localhost:${PORT}`);
      console.log(`Uploads directory: ${getUploadsDir()}`);
    });
  } catch (err) {
    console.error('Failed to start server:', err.message);
    console.error(
      'Check MySQL is running and DB_* values in .env are correct (DB_HOST, DB_USER, DB_PASSWORD, DB_NAME).'
    );
    process.exit(1);
  }
}

start();
