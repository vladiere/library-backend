import verifyToken from "../middlewares/verifyToken";
import notificationsController from "../controllers/notifications.controller";
import { Router } from "express";

const router = Router();

// Notifications
router.get('/notifications/librarian', verifyToken, notificationsController.getLibrarianNotifications);
router.get('/notifications/clear', verifyToken, notificationsController.clearAllLibrarianNotifications);
router.post('/notifications/user', verifyToken, notificationsController.getUserNotifications);
router.post('/notifications/clear', verifyToken, notificationsController.clearAllUserNotifications);

export default router;

