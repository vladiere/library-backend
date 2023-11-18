import { Router } from 'express';
import verifyToken from "../middlewares/verifyToken";
import allController from "../controllers/all.controller";

const router = Router();

router.get('/contributorsbooks/all', verifyToken, allController.getAllContributorsBooks);

export default router;
