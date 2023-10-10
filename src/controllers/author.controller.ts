import authorService from "../services/authors.service";
import { Request, Response, NextFunction } from "express";
import logger from "../config/logger";

// Authors
const getAllAuthorRecords = async (req: Request, res: Response) => {
  try {
    const result = await authorService.getAllAuthorRecords();
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting all authors record Error : ");
    console.error(error.message);
    return res.status(500).json({ error });
  }
};
const getSingleAuthorRecord = async (req: Request, res: Response) => {
  try {
    const { id } = req.body;

    const result = await authorService.getSingleAuthorRecord(id);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting single author record Error : ");
    console.error(error.message);
    return res.status(500).json({ error });
  }
};

export default {
  getAllAuthorRecords,
  getSingleAuthorRecord,
};
