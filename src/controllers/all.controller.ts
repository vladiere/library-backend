import { Request, Response } from 'express';
import allService from '../services/all.service';
import logger from "../config/logger";


const getAllContributorsBooks = async (req: Request, res: Response) => {
    try {
        const result = await allService.getAllContributorsBooks();
        return res.status(200).json(result);
    } catch (error) {
        logger.error('Getting all contributors and books error at controller: ');
        console.error(error);
        return res.status(500).json(error);
    }
} 


export default {
    getAllContributorsBooks,
}
