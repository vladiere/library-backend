import verifyRefreshToken from "../middlewares/refreshToken";
import { Router } from "express";

const router = Router();

router.post("/refresh/user/tokens", verifyRefreshToken);

export default router;
