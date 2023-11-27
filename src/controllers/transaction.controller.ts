import { Request, Response } from "express";
import logger from "../config/logger";
import transactionService from "../services/transaction.service";

const getBookTransactions = async (req: Request, res: Response) => {
  try {
    const { option, transaction_status } = req.body;
    const result = await transactionService.getBookTransactions(option, transaction_status);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting book transactions error at controller");
    console.error(error);
    return res.status(500).json(error);
  }
};

const checkedOutReturn = async (req: Request, res: Response) => {
  try {
    const { transaction_id, transaction_type, transaction_status } = req.body;
    const result = await transactionService.checkedOutReturn(transaction_id, transaction_type, transaction_status);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Check out and return error at controller");
    console.error(error);
    return res.status(500).json(error);
  }
};

const getFinesAndFeesSummary = async (req: Request, res: Response) => {
  try {
    const result = await transactionService.getFinesAndFeesSummary();
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Getting fines and fees summary error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
}

const renewalBook = async (req: Request, res: Response) => {
  try {
    const { number_date, transaction_id } = req.body;
    const result = await transactionService.renewalBook(number_date,transaction_id);
    return res.status(200).json(result);
  } catch (error) {
    logger.error('Renewal of book error at controller: ');
    console.error(error);
    return res.status(500).json(error);
  }
}

const getAllRenewalBook = async (req: Request, res: Response) => {
  try {
    const result = await transactionService.getAllRenewalBook();
    return res.status(200).json(result);
  } catch (error) {
    logger.error('Getting all renewal detail error at controller: ');
    console.error(error);
    return res.status(500).json(error);
  }
}

const manageRenewalBook = async (req: Request, res: Response) => {
  try {
    const { renewal_id, renewal_status } = req.body;
    const result = await transactionService.manageRenewalBook(renewal_id,renewal_status);
    return res.status(200).json(result);
  } catch (error) {
    logger.error('Managing renewal book error at controller: ');
    console.error(error);
    return res.status(500).json(error);
  }
}

export default {
  getBookTransactions,
  checkedOutReturn,
  getFinesAndFeesSummary,
  getAllRenewalBook,
  manageRenewalBook,
  renewalBook,
}
