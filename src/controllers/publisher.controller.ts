import publishersService from "../services/publishers.service";
import { Request, Response, NextFunction } from "express";
import logger from "../config/logger";

// Publishers
const getAllPublisherRecords = async (req: Request, res: Response) => {
  try {
    const result = await publishersService.getAllPublisherRecords();

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting all publishers record Error : ");
    console.error(error.message);
    return res.status(500).json({ error });
  }
};
const getSinglePublisherRecord = async (req: Request, res: Response) => {
  try {
    const { id } = req.body;

    const result = await publishersService.getSinglePublisherRecord(id);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting single publisher record Error : ");
    console.error(error.message);
    return res.status(500).json({ error });
  }
};

export default {
  getAllPublisherRecords,
  getSinglePublisherRecord,
};
