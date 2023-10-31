import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";

const getBookTransactions = async () => {
  try {
    const query = "SELECT * FROM transactions_book";
    const result = await executeQuery(query);
    return result;
  } catch (error: any) {
    logger.error("Getting book transactions error at servive");
    console.error(error);
    return error;
  }
};

const checkedOutReturn = async (
  transaction_id: number,
  transaction_type: string,
) => {};

export default {
  getBookTransactions,
};
