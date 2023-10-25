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

const getAuthorBooks = async (req: Request, res: Response) => {
  try {
    const { author_name } = req.body;

    const result = await authorService.getAuthorBooks(author_name);

    return res.status(200).json(result);
  } catch (error) {
    logger.error('Getting author books error at controller');
    console.error(error);
    return res.status(500).json(error)
  }
}

export default {
  getAllAuthorRecords,
  getSingleAuthorRecord,
  getAuthorBooks,
};
