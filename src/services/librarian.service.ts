import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";
import ILibrarian from "../models/userModel";

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

const getAllUserContributions = async (file_status: string) => {
  try {
        let query = "";
        if (file_status === 'all') {
            query = "SELECT * FROM contribution_details WHERE file_status != ? ORDER BY uploaded_date ASC";
        } else {
            query = "SELECT * FROM contribution_details WHERE file_status = ? ORDER BY uploaded_date ASC";
        }
        const result = executeQuery(query,[file_status]);
        return result;
    } catch (error) {
        logger.error('Getting all user contributions error at service');
        console.error(error);
        return error;
    }
}

const manageUserContribution = async (action: string, user_id: number, p_status: string, contribution_id: number) => {
  try {
    const query = "CALL ManageContributionBookStatus(?,?,?,?)";
    const result: any = await executeQuery(query,[action, user_id, p_status, contribution_id])
    console.log(result[0][0])
    return result[0][0];
  } catch (error) {
    logger.error('Managing user contribution error at service');
    console.error(error);
    return error;
  }
}

const calculateFinesFees = async () => {
  try {
    const query = "CAll CalculateAndApplyFines()";
    const result = await executeQuery(query);
    return { message: 'Calculated fines and fees' };
  } catch (error) {
    logger.error('Getting fines and fees error at service: ');
    console.error(error);
    return error;
  }
}

export default {
  getAllLibrarian,
  updateLibrarianInfo,
  getAllUserContributions,
  manageUserContribution,
  calculateFinesFees,
};
