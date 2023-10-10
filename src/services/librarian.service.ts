import logger from "../config/logger";
import ILibrarian from "../models/userModel";
import { executeQuery } from "../functions/executeQuery";

const getAllLibrarian = async (id: number, option: string) => {
  try {
    let query =
      option === "single"
        ? `SELECT * FROM librarian_details WHERE librarian_id = ${id};`
        : `SELECT * FROM librarian_details WHERE librarian_id != ${id};`;

    const result = await executeQuery(query);

    return result;
  } catch (error: any) {
    logger.error("Getting all librarian Error: ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};

const updateLibrarianInfo = async (librarian: ILibrarian) => {
  try {
    const query = `CALL UpdateLibrarianInfo(${librarian.librarian_id}, '${librarian.street_address}', '${librarian.city}', '${librarian.state_province_region}', ${librarian.postal_code}, '${librarian.address_type}', '${librarian.email_address}', '${librarian.phone_number}', '${librarian.hobbies}', '${librarian.description}');`;

    const result: any = await executeQuery(query);

    return result[0][0];
  } catch (error) {
    logger.error("Updating librarian service info Error: ");
    console.error(error);
    return error;
  }
};

export default {
  getAllLibrarian,
  updateLibrarianInfo,
};
