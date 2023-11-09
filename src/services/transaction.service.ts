import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";

const getBookTransactions = async (
  option: string,
  transaction_status: string,
) => {
  try {
    let query = "";
    if (option === "Checked Out" && transaction_status === "Completed") {
      query = `SELECT * FROM transactions_book WHERE transaction_type != '${option}' AND status != '${transaction_status}'`;
    } else if (option === "Checked Out" && transaction_status === "Active") {
      query = `SELECT * FROM transactions_book WHERE transaction_type = '${option}' AND status = '${transaction_status}'`;
    } else {
      if (transaction_status === "all") {
        query = "SELECT * FROM transactions_book WHERE status != 'Active'";
      } else {
        query = `SELECT * FROM transactions_book WHERE status = '${transaction_status}'`;
      }
    }

    const result = await executeQuery(query);
    return result;
  } catch (error: any) {
    logger.error("Getting book transactions error at servive");
    console.error(error);
    return error;
  }
};

const getFinesAndFeesSummary = async () => {
  try {
    const query = "CALL DisplayFinesAndFees();";
    const result: any = await executeQuery(query);
    return result[0];
  } catch (error: any) {
    logger.error("Getting fines and fees summary error at servive");
    console.error(error);
    return error;
  }
};

const checkedOutReturn = async (
  transaction_id: number,
  transaction_type: string,
  transaction_status: string,
) => {
  try {
    const query = "CALL CheckedOutReturnBook(?,?,?);";
    const result: any = await executeQuery(query, [
      transaction_id,
      transaction_type,
      transaction_status,
    ]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Check out and return error at service:");
    console.error(error);
    return error;
  }
};

export default {
  getBookTransactions,
  checkedOutReturn,
  getFinesAndFeesSummary,
};
