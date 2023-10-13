import { Router } from "express";
import registerHandler from '../handlers/registerHandler'
import uploadImage from "../config/multer";

const router = Router();

router.post('/user/register/upload/image', uploadImage.single('image'), registerHandler.handleImagesComparison)


export default router;
