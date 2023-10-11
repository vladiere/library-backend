import { Request, Response, NextFunction } from "express";
import ILibrarian from "../models/userModel";
import authService from "../services/auth.service";
import logger from "../config/logger";

const getDefault = async (req: Request, res: Response) => {
  return await authService.getDefault; 
}
const registerLibrarian = async (req: Request, res: Response) => {
  try {
    const librarian: ILibrarian = req.body;
    const result = await authService.registerLibrarian(librarian);
    return res.status(201).json(result);
  } catch (error: any) {
    logger.error("Registration Error:");
    console.error(error);
    return res.status(500).json({ error: error.message });
  }
};

const loginLibrarian = async (req: Request, res: Response) => {
  try {
    const { username, password } = req.body.form;

    const user = await authService.loginLibrarian(username, password);
    return res.status(200).json({ user });
  } catch (error: any) {
    logger.error("Login Error:");
    console.error(error);
    return res.status(500).json({ error: error.message });
  }
};

const logoutLibrarian = async (req: Request, res: Response) => {
  try {
    const { refreshToken } = req.body;

    const result = await authService.logoutLibrarian(refreshToken);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Logging out librarian in controller Error:");
    console.error(error);
    throw new Error(error);
  }
};

const changePassLibrarian = async (req: Request, res: Response) => {
  try {
    const { librarian_data } = req.body;
    const result = await authService.changeUserPassword(
      librarian_data.password,
      librarian_data.librarian_id,
    );

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Changing password in controller Error: ");
    console.error(error);
    return res.status(500).json(error);
  }
};

export default {
  loginLibrarian,
  registerLibrarian,
  logoutLibrarian,
  changePassLibrarian,
  getDefault
};
