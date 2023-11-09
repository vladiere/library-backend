import { Router } from "express";
import registerHandler from "../handlers/registerHandler";
import uploadImage from "../config/multer";
import userController from "../controllers/user.controller";
import verifyToken from "../middlewares/verifyToken";
import multerFile from "../config/multerFile";

const router = Router();

router.post(
  "/user/register/upload/image",
  uploadImage.single("image"),
  registerHandler.handleImagesComparison,
);
router.post("/user/register", userController.registerUser);
router.post("/user/login", userController.loginUser);
router.post("/user/logout", verifyToken, userController.logoutUser);
router.post("/user/get/details", verifyToken, userController.getUser);
router.post(
  "/user/change/password",
  verifyToken,
  userController.changeUserPass,
);
router.post(
  "/user/get/borrowed/books",
  verifyToken,
  userController.getMyBorrowedBooks,
);
router.post(
  "/user/book/contribute",
  verifyToken,
  multerFile.single("file_book"),
  userController.userContribute,
);

router.get("/user/active", verifyToken, userController.getActiveUser);
export default router;
