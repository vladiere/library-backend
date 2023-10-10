import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";

// --------------------------------------------------------------------------------
// Publishers
const getAllPublisherRecords = async () => {
  try {
    const query = "SELECT * FROM publishers;";

    const result = await executeQuery(query);

    return result;
  } catch (error: any) {
    logger.error("Getting all publishers records Error : ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};
const getSinglePublisherRecord = async (publisher_id: any) => {
  try {
    const query = `SELECT * FROM publishers WHERE publisher_id = ${publisher_id};`;

    const result = await executeQuery(query);

    return result;
  } catch (error: any) {
    logger.error("Getting all publisher record Error : ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};

export default {
  getAllPublisherRecords,
  getSinglePublisherRecord,
};
