import { Router } from 'express';
import {
  listProducts,
  getProduct,
  createProduct,
  updateProduct,
  deleteProduct,
  uploadImage,
} from '../controllers/productController.js';
import { requireAuth } from '../middleware/auth.js';
import { uploadProductImage } from '../middleware/upload.js';

const router = Router();

router.use(requireAuth);

router.get('/', listProducts);
router.get('/:id', getProduct);
router.post('/', uploadProductImage, createProduct);
router.put('/:id', uploadProductImage, updateProduct);
router.delete('/:id', deleteProduct);
router.post('/:id/image', uploadProductImage, uploadImage);

export default router;
