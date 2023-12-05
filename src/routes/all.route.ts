import { Router } from 'express';
import verifyToken from "../middlewares/verifyToken";
import allController from "../controllers/all.controller";

const router = Router();

router.get('/contributorsbooks/all', verifyToken, allController.getAllContributorsBooks);
router.get('/dashboard', verifyToken, allController.getDashboard);
router.get('/stats', verifyToken, allController.getStats);
router.get('/holds/records', verifyToken, allController.getHolds);

export default router;
