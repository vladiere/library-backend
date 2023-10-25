import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";

// --------------------------------------------------------------------------------
// Authors
const getAllAuthorRecords = async () => {
  try {
    const query = "SELECT * FROM authors";

    const result = await executeQuery(query);

    return result;
  } catch (error: any) {
    logger.error("Getting all author records Error : ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};
const getSingleAuthorRecord = async (author_id: number) => {
  try {
    const query = `SELECT * FROM authors WHERE author_id = ${author_id};`;

    const result = await executeQuery(query);

    return result;
  } catch (error: any) {
    logger.error("Getting single author record Error : ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};

const getAuthorBooks = async (author_name: string) => {
  try {
    const query = 'SELECT * FROM book_inventory WHERE author_name = ?;';

    const result = await executeQuery(query, [author_name])

    return result;
  } catch (error) {
    logger.error('Getting author books error at service');
    console.error(error);
    return error;
  }
}

export default {
  getAllAuthorRecords,
  getSingleAuthorRecord,
  getAuthorBooks,
};
