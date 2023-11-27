import logger from "../config/logger";
import circulationService from "../services/circulation.service";
import { Request, Response } from "express";

const insertPendingTransaction = async (req: Request, res: Response) => {
  try {
    const { book_id, user_id, transaction_type } = req.body;
    const result = await circulationService.insertPendingTransaction(book_id, user_id, transaction_type);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Inserting pending transaction error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
};

const cancelPendingTransaction = async (req: Request, res: Response) => {
  try {
    const { transaction_id } = req.body;
    const result = await circulationService.cancelPendingTransaction(transaction_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Cancel pending transaction error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
};

const approvePendingTransaction = async (req: Request, res: Response) => {
  try {
    const { transaction_id } = req.body;
    const result = await circulationService.approvePendingTransaction(transaction_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Approve pending transaction error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
};

const getAllUserLists = async (req: Request, res: Response) => {
  try {
    const { user_id } = req.body;
    const result = await circulationService.getAllUserLists(user_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Getting all user lists error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
}

const createUserLists = async (req: Request, res: Response) => {
  try {
    const { user_id, list_name, list_desc } = req.body;
    const result = await circulationService.createUserLists(user_id, list_name, list_desc);
    return res.status(201).json(result);
  } catch (error: any) {
    logger.error('creating user lists error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
};

const deleteUserList = async (req: Request, res: Response) => {
  try {
    const { list_id } = req.body;
    const result = await circulationService.deleteUserList(list_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Deleting user list error at controller');
    console.error(error);
    return res.status(500).json(error)
  }
};

const updateUserList = async (req: Request, res: Response) => {
  try {
    const { list_id, new_name, list_desc } = req.body;
    const result = await circulationService.updateUserList(list_id, new_name, list_desc);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Updating user list error at controller');
    console.error(error);
    return 
  }
};

const insertNewlistContent = async (req: Request, res: Response) => {
  try {
    const { list_id, book_id } = req.body;
    const result = await circulationService.insertNewlistContent(list_id, book_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Inser new list content error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
};

const insertCollection = async (req: Request, res: Response) => {
  try {
    const { user_id, book_id } = req.body;
    const result = await circulationService.insertCollection(user_id, book_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Inserting collection error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
};

const removeCollection = async (req: Request, res: Response) => {
  try {
    const { collection_id } = req.body;
    const result = await circulationService.removeCollection(collection_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Removing collection error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
};

const getAllPendingTransactions = async (req: Request, res: Response) => {
  try {
    const result = await circulationService.getAllPendingTransactions();
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Getting all pending transactions error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
}

export default {
  insertPendingTransaction,
  cancelPendingTransaction,
  approvePendingTransaction,
  createUserLists,
  deleteUserList,
  updateUserList,
  insertNewlistContent,
  insertCollection,
  removeCollection,
  getAllPendingTransactions,
  getAllUserLists,
}
