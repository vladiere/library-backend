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

const renewalBook = async (number_date: number, transaction_id: number) => {
  try {
    const query = "CALL RenewalBorrowedBook(?,?)";
    const result: any = await executeQuery(query, [number_date, transaction_id]);
    console.log(result[0][0])
    return result[0][0];
  } catch (error) {
    logger.error('Renewal of book error at service: ');
    console.error(error);
    return error;
  }
}

const getAllRenewalBook = async () => {
  try {
    const query = "CALL GetRenewalDetails()";
    const result: any = await executeQuery(query);
    return {
      pending_renewals: result[0],
      all_renewal: result[1]
    }
  } catch (error) {
    logger.error('Getting all renewal book error at service: ');
    console.error(error);
    return error;
  }
}

const manageRenewalBook = async(renewal_id: number, renewal_status: string) => {
  try {
    console.log('renewal_id: ', renewal_id);
    let query = "";
    if (renewal_status === 'Approved') {
      query = "CALL ApproveBookRenewal(?)";
    } else if (renewal_status === 'Cancelled') {
      query = "CALL CancelRenewalBook(?)";
    }
    const result: any = await executeQuery(query, [renewal_id]);
    console.log(result)
    return result[0][0];
  } catch (error) {
    logger.error('Mangaing renewal book error at service: ');
    console.error(error);
    return error;
  }
}

export default {
  getBookTransactions,
  checkedOutReturn,
  getFinesAndFeesSummary,
  renewalBook,
  manageRenewalBook,
  getAllRenewalBook,
};
