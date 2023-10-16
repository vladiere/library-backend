import { Request, Response } from "express";
import userService from "../services/user.service";
import logger from "../config/logger";

const registerUser = async (req: Request, res: Response) => {
  try {
    const { form } = req.body;
    console.log(form)
    const result = await userService.registerUser(form);
    
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Register use in controller Error: ");
    console.error(error);
    return res.status(500).json({ error, message: error.message });
  }
};

export default {
  registerUser,

}
