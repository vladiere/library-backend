import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";

const insertPendingTransaction = async (
  book_id: number,
  user_id: number,
  transaction_type: string,
) => {
  try {
    const query = "CALL InsertPendingTransaction(?,?,?)";
    const result: any = await executeQuery(query, [
      book_id,
      user_id,
      transaction_type,
    ]);
    console.log(result[0][0]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Inserting pending transaction error at service");
    console.error(error);
    return error;
  }
};

const cancelPendingTransaction = async (transaction_id: number) => {
  try {
    const query = "CALL CancelPendingTransaction(?)";
    const result: any = await executeQuery(query, [transaction_id]);
    console.log(result[0][0]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Cancelled pending transaction error at service");
    console.error(error);
    return error;
  }
};

const approvePendingTransaction = async (transaction_id: number) => {
  try {
    const query = "CALL ApprovePendingTransaction(?)";
    const result: any = await executeQuery(query, [transaction_id]);
    console.log(result[0][0]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Approved pending transaction error at service");
    console.error(error);
    return error;
  }
};

const getAllUserLists = async (user_id: number) => {
  try {
    const query = "SELECT list_id, list_name, DATE_FORMAT(created_at, '%M %e, %Y') AS created_at, list_status, list_desc FROM user_lists WHERE user_id = ?";
    const result = await executeQuery(query, [user_id]);
    return result;
  } catch (error: any) {
    logger.error('Getting all user lists error at service');
    console.error(error);
    return error;
  }
}

const createUserLists = async (user_id: number, list_name: string, list_desc: string) => {
  try {
    const query = "CALL CreateNewList(?,?,?)";
    const result: any = await executeQuery(query, [user_id, list_name, list_desc]);
    console.log(result[0][0]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Insert user list error at service");
    console.error(error);
    return error;
  }
};

const deleteUserList = async (list_id: number) => {
  try {
    const query = "CALL DeleteUserList(?)";
    const result: any = await executeQuery(query, [list_id]);
    console.log(result[0][0]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Deleting user list error at servive");
    console.error(error);
    return error;
  }
};

const updateUserList = async (list_id: number, new_name: string, list_desc: string) => {
  try {
    const query = "CALL UpdateUserList(?,?,?)";
    const result: any = await executeQuery(query, [list_id, new_name, list_desc]);
    console.log(result[0]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Updating user list error at service");
    console.error(error);
    return error;
  }
};

const insertNewlistContent = async (list_id: number, book_id: number) => {
  try {
    const query = "CALL InsertContentList(?,?)";
    const result: any = await executeQuery(query, [list_id, book_id]);
    console.log(result[0][0]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Inserting new list content error at service");
    console.error(error);
    return error;
  }
};

const insertCollection = async (user_id: number, book_id: number) => {
  try {
    const query = "CALL InsertCollection(?,?)";
    const result: any = await executeQuery(query, [user_id, book_id]);
    console.log(result[0][0]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Inserting collection error at service");
    console.error(error);
    return error;
  }
};

const removeCollection = async (collection_id: number) => {
  try {
    const query = "CALL RemoveCollection(?)";
    const result: any = await executeQuery(query, [collection_id]);
    console.log(result[0][0]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Removing collection error at service");
    console.error(error);
    return error;
  }
};

const getAllPendingTransactions = async () => {
  try {
    const query = "CALL GetPendingTransactions()";
    const result: any = await executeQuery(query);
    console.log(result);
    return { 
      reserved: result[0],
      held: result[1],
      borrowed: result[2],
      renewal: result[3],
      approved: result[4],
      finefees: result[5],
      all_renewals: result[6],
    };
  } catch (error: any) {
    logger.error("Getting all pending transactions error at service");
    console.error(error);
    return error;
  }
};

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
};
