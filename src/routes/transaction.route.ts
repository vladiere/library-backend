import { Router } from "express";
import transactionController from "../controllers/transaction.controller";
import verifyToken from "../middlewares/verifyToken";

const router = Router();

router.get(
  "/transaction/fines_fees/summary",
  verifyToken,
  transactionController.getFinesAndFeesSummary,
);

router.post(
  "/transaction/book/all",
  verifyToken,
  transactionController.getBookTransactions,
);
router.post(
  "/transaction/book/check_return",
  verifyToken,
  transactionController.checkedOutReturn,
);

export default router;
