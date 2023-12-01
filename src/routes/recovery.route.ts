import { Router } from 'express';
import recoveryController from '../controllers/recovery.controller';
import verifyToken from '../middlewares/verifyToken';

const router = Router();

router.post('/send/email', recoveryController.sendEmailResetPassword);
router.post('/reset/password', verifyToken, recoveryController.resetPassword);

export default router;
