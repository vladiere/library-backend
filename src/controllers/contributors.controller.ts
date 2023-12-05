import { Request, Response } from 'express';
import logger from "../config/logger";
import contributorService from '../services/contributors.service';

const editContribution = async (req: Request, res: Response) => {
  try {
    const { contribution_id, author, title, description } = req.body;
    const result = await contributorService.editContribution(contribution_id, author, title, description);
    return res.status(200).json(result);
  } catch (error) {
    logger.error('Editing contribution error at controller: ');
    console.error(error);
    return res.status(500).json(error);
  }
}

const removeContribution = async (req: Request, res: Response) => {
  try {
    const { contribution_id } = req.body;
    const result = await contributorService.removeContribution(contribution_id);
    return res.status(200).json(result);
  } catch (error) {
    logger.error('Removing contribution error at controller: ');
    console.error(error);
    return res.status(500).json(error);
  }
}

export default {
  editContribution,
  removeContribution,
}


