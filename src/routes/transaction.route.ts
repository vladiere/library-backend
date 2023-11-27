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
router.post(
  "/transaction/renew/book",
  verifyToken,
  transactionController.renewalBook
)
router.get(
  "/transaction/renew/get",
  verifyToken,
  transactionController.getAllRenewalBook
)
router.post(
  "/transaction/renew/manage",
  verifyToken,
  transactionController.manageRenewalBook
)

export default router;
