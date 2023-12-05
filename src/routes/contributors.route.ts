import { Router } from 'express';
import verifyToken from "../middlewares/verifyToken";
import contributorController from '../controllers/contributors.controller';

const router = Router();

router.post('/contribution/edit', verifyToken, contributorController.editContribution);
router.post('/contribution/remove', verifyToken, contributorController.removeContribution);

export default router;
