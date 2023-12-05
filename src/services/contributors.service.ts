import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";

const editContribution = async(contribution_id: number, author: string, title: string, description: string) => {
  try {
    const query = "CALL ManageContributions(?,?,?,?,?)";
    const result: any = await executeQuery(query, [contribution_id, title, description, author, '']);
    return result[0][0];
  } catch (error) {
    logger.error('Editing contributions error at service: ');
    console.error(error);
    return error;
  }
}

const removeContribution = async(contribution_id: number) => {
  try {
    const query = "CALL ManageContributions(?,?,?,?,?)";
    const result: any = await executeQuery(query, [contribution_id,'','','','removed']);
    return result[0][0];
  } catch (error) {
    logger.error('Removing contribution error at service: ');
    console.error(error);
    return error;
  }
}

export default {
  editContribution,
  removeContribution,
}
