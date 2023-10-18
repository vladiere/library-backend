import logger from "../config/logger";
import { executeQuery } from "./executeQuery";
import { defaults } from "joi";

const LoginUser = async (email_address: string, login_status: string) => {
  try {
    const query = "CALL LoginUser(?,?);";

    const result = executeQuery(query, [email_address, login_status]);

    return result;
  } catch (error: any) {
    logger.error("Error logging in user:");
    console.error(error);
    return error;
  }
};


export default LoginUser;
