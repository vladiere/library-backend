import { Router } from "express";
import authController from "../controllers/auth.controller";
import verifyToken from "../middlewares/verifyToken";
import librarianController from "@controllers/librarian.controller";

const router = Router();

router.get("/", librarianController.getTesting);
router.post(
  "/register/librarian",
  verifyToken,
  authController.registerLibrarian,
);
router.post("/login/librarian", authController.loginLibrarian);
router.post("/logout/librarian", verifyToken, authController.logoutLibrarian);
router.post(
  "/librarian/change/password",
  verifyToken,
  authController.changePassLibrarian,
);

export default router;
