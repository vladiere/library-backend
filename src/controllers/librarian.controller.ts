import { Request, Response } from "express";
import logger from "../config/logger";
import librarianService from "../services/librarian.service";

const getLibrarianData = async (req: Request, res: Response) => {
  try {
    const { librarian_id, option } = req.body;

    const librarianData = await librarianService.getAllLibrarian(
      librarian_id,
      option,
    );
    return res.status(200).json(librarianData);
  } catch (error: any) {
    logger.error("Error in getting librarian data: ");
    console.error(error.message);
    return res.status(500).json({ error: error.message });
  }
};

const updateLibrarianInfo = async (req: Request, res: Response) => {
  try {
    const { librarian_info } = req.body;

    const result = await librarianService.updateLibrarianInfo(librarian_info);

    return res.status(200).json(result);
  } catch (error) {
    logger.error("Updating librarian controller info Error: ");
    console.error(error);
    return res.status(500).json(error);
  }
};

export default {
  getLibrarianData,
  updateLibrarianInfo,
};
