import circulationController from "../controllers/circulation.controller";
import verifyToken from "../middlewares/verifyToken";
import { Router } from "express"

const router = Router();

router.post('/transaction/insert', verifyToken, circulationController.insertPendingTransaction);
router.post('/transaction/cancel', verifyToken, circulationController.cancelPendingTransaction);
router.post('/transaction/approve', verifyToken, circulationController.approvePendingTransaction);

// For user lists and list contents
router.post('/list/create', verifyToken, circulationController.createUserLists);
router.post('/list/update', verifyToken, circulationController.updateUserList);
router.post('/list/remove', verifyToken, circulationController.deleteUserList);
router.post('list/add', verifyToken, circulationController.insertNewlistContent);

// Book Collection
router.post('/collection/insert', verifyToken, circulationController.insertCollection);
router.post('/collection/remove', verifyToken, circulationController.removeCollection);

export default router;
