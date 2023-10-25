import { Connect, Query } from "../config/mysql";
import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";
import IUser from "../models/userModel";
import bcryptjs from "bcryptjs";
import signedJWT from "../functions/signedJWT";
import LoginUser from "../functions/loginUser";

const registerUser = async (user_data: IUser) => {
  try {
    const query = "CALL RegisterUser(?,?,?,?,?,?)";

    const hash = await bcryptjs.hash(user_data.password, 10);
    const result: any = await executeQuery(query, [
      user_data.id_number,
      user_data.fullname,
      user_data.department,
      user_data.email,
      user_data.role,
      hash,
    ]);
    console.log(result);
    return result[0];
  } catch (error: any) {
    logger.error("User registration Error:");
    console.log(error);
    return error;
  }
};

const loginUser = async (
  email_address: string,
  password: string,
): Promise<string | any> => {
  let query = "CALL AccessLoginUser(?);";

  try {
    const connection = await Connect();
    const users: any = await Query<IUser[]>(connection, query, [email_address]);
    connection.end();

    if (users[0][0].status === 404) {
      // Reject the Promise with an error message
      throw new Error(users[0][0].message);
    }

    const result = await new Promise((resolve, reject) => {
      bcryptjs.compare(password, users[0][0].password, (error, result) => {
        if (error) {
          logger.error(error);
          // Reject the Promise with an error object
          reject({
            message: error.message,
            error,
            status: 500,
          });
        } else if (result) {
          signedJWT(users[0], (_error, accessToken, refreshToken) => {
            if (_error) {
              LoginUser(email_address, "login unable");
              // Reject the Promise with an error object
              reject({
                message: "Unable to SIGN Token",
                error: _error,
                status: 401,
              });
            } else if (accessToken && refreshToken) {
              LoginUser(email_address, "Success");

              // Resolve the Promise with the desired value
              resolve({
                user_id: users[0][0].user_id,
                privilege: users[0][0]?.privilege,
                accessToken,
                refreshToken,
              });
            }
          });
        } else {
          LoginUser(email_address, "Failed");
          // Reject the Promise with an error object
          reject({
            message: "Login failed wrong password",
            status: 500,
          });
        }
      });
    });

    return result; // Resolve the Promise with the result
  } catch (error: any) {
    logger.error("Connection Error");
    console.error(error);
    // Reject the Promise with an error object
    throw {
      message: error.message,
      error,
      status: 500,
    };
  }
};

const getUser = async (user_id: number) => {
  try {
    let query = "";

    if (user_id == 0) {
      query = "SELECT * FROM user_details WHERE user_id";
    } else {
      query = "SELECT * FROM user_details WHERE user_id = ?";
    }

    const result = await executeQuery(query, [user_id]);

    return result;
  } catch (error: any) {
    logger.error("Getting user details error at service");
    console.error(error);
    return error;
  }
};

const logoutUser = async (refresh_token: string) => {
  try {
    const query = "CALL LogoutUser(?)";

    const result: any = await executeQuery(query, [refresh_token]);

    return result[1]
  } catch (error: any) {
    logger.error("Logging out Librarian Error:");
    console.error(error);
    throw new Error(error);
  }
};

const changeUserPass = async (email: string, password: string) => {
  try {
    if (email !== "" && password !== "") {
      const query = "CALL ChangeUserPass(?,?);";
      const hash = await bcryptjs.hash(password, 10);
      const result = await executeQuery(query, [email, hash]);

      return result;
    } else {
      return {
        message: "Empty value",
        status: 500,
      };
    }
  } catch (error: any) {
    logger.error("Changing password error at service:");
    console.error(error);
    return error;
  }
};

export default {
  registerUser,
  loginUser,
  logoutUser,
  getUser,
  changeUserPass,
};
