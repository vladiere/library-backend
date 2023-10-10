import librarianController from "../controllers/librarian.controller";
import verifyToken from "../middlewares/verifyToken";
import { Router } from "express";

const router = Router();

router.post(
  "/get/librarian",
  verifyToken,
  librarianController.getLibrarianData,
);
router.post(
  "/update/librarian/info",
  verifyToken,
  librarianController.updateLibrarianInfo,
);

export default router;
