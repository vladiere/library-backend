import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";
import IUser from "../models/userModel";
import bcryptjs from "bcryptjs";

const registerUser = async (user_data: IUser) => {
  try {
    const query = "CALL RegisterUser(?,?,?,?,?)";

    const hash = await bcryptjs.hash(user_data.password, 10);
    const result: any = await executeQuery(query, [
      user_data.id_number,
      user_data.fullname,
      user_data.department,
      user_data.email,
      hash,
    ]);
    console.log(result)
    return result[0];
  } catch (error: any) {
    logger.error("User registration Error:");
    console.log(error);
    return error;
  }
};


export default {
  registerUser,
}
