import { executeQuery } from "../functions/executeQuery";
import logger from "../config/logger";

const getAllContributorsBooks = async () => {
    try {
        const query = "CALL AllContributorsAndBooks()";
        const result = await executeQuery(query);
        return result;
    } catch (error) {
        logger.error('Getting all contributors and books error at service: ');
        console.error(error);
        return error;
    }
}

const getDashboard = async () => {
  try {
    const result: any = await executeQuery('CALL ReportsDashboard()');
    return {
      total_fine_fees: result[0][0],
      total_active: result[1][0],
      department_online: result[2],
      new_register: result[3][0],
      trend_books: result[4],
      busy_book_borrowed: result[5],
      trend_books_for_user: result[6],
    };
  } catch (error) {
    logger.error('Getting dashboar error at service: ');
    console.error(error);
    return error;
  }
}

const getStats = async () => {
  try {
    const query = "CALL GetTransactionBookStats()";

    const result: any = await executeQuery(query);
    console.log(result);
    return {
      transaction_book: result[0],
      online_department: result[1],
      fines_fees: result[2],
    };
  } catch (error) {
    logger.error('Getting all stats error at service: ');
    console.error(error)
    return error;
  }
}

export default {
  getAllContributorsBooks,
  getDashboard,
  getStats
}
