import { Router } from "express";
import registerHandler from '../handlers/registerHandler'
import uploadImage from "../config/multer";
import userController from '../controllers/user.controller'

const router = Router();

router.post('/user/register/upload/image', uploadImage.single('image'), registerHandler.handleImagesComparison)
router.post('/user/register', userController.registerUser)

export default router;
