import { Router } from "express";
import registerHandler from "../handlers/registerHandler";
import uploadImage from "../config/multer";
import userController from "../controllers/user.controller";
import verifyToken from "../middlewares/verifyToken";

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
router.post("/user/change/password", verifyToken, userController.changeUserPass);

export default router;
