import { Router } from 'express';
import { listPublicProducts } from '../controllers/publicController.js';

const router = Router();

router.get('/products', listPublicProducts);

export default router;
