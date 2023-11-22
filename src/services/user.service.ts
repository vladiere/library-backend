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
          console.error(error);
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
                privilege: users[0][0]?.privilege || users[0][0]?.role,
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
    const query = "SELECT * FROM user_details WHERE user_id = ?";
    const result = await executeQuery(query, [user_id]);

    return result;
  } catch (error: any) {
    logger.error("Getting user details error at service");
    console.error(error);
    return error;
  }
};

const getActiveUser = async () => {
  try {
    const query =
      "SELECT COUNT(*) AS total_active FROM user_details WHERE user_status = ?";

    const result: any = await executeQuery(query, ["active"]);
    return result[0];
  } catch (error: any) {
    logger.error("Getting active users error at service");
    console.error(error);
    return error;
  }
};

const logoutUser = async (refresh_token: string) => {
  try {
    const query = "CALL LogoutUser(?)";

    const result: any = await executeQuery(query, [refresh_token]);

    return result[1];
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

const getMyBorrowedBooks = async (user_id: number) => {
  try {
    const query = "CALL GetTransactionBookAndPending(?)"
    const result: any = await executeQuery(query, [user_id]);
    return {
        transaction_pending: result[1],
        transaction_book: result[0],
    };
  } catch (error: any) {
    logger.error("Getting my borrowed books error at service");
    console.error(error);
    return error;
  }
};

const userContribute = async (user_id: number, file_path: string, file_title: string, file_author: string, file_category: string,file_publisher: string, file_description: string) => {
  try {
    const query = "CALL UserBookContribute(?,?,?,?,?,?,?)";
    const result: any = await executeQuery(query, [user_id, file_path, file_title, file_author, file_category, file_publisher, file_description]);
    return result[0][0];
  } catch (error: any) {
    logger.error("User contributing error at service");
    console.error(error);
    return error;
  }
};

const getUserContributions = async (user_id: number) => {
  try {
    let query = '';
    if (user_id !== 0) {
      query = `SELECT * FROM contribution_details WHERE user_id = ${user_id} ORDER BY file_total_downloads ASC`;
    } else {
      query = 'SELECT * FROM contribution_details WHERE file_status = "accepted" ORDER BY file_total_downloads ASC';
    }
    const result = await executeQuery(query);
    return result;
  } catch (error) {
    logger.error('Getting user contributions error at servive');
    console.error(error);
    return error;
  }
}

const addInstructorRecommendations = async (user_id: number, book_id: number) => {
    try {
        const query = "CALL AddInstructorRecommendations(?,?)";
        const result: any = await executeQuery(query, [user_id,book_id]);
        return result[0][0];
    } catch (error) {
        logger.error('Adding instructor recommendations error at service: ');
        console.error(error);
        return error;
    }
}

const getPersonalizeInstructorRecommendations = async (p_role: string, user_id: number) => {
    try {
        const query = "CALL GetPersonalizeInstructorRecommendations(?,?)";
        const result: any = await executeQuery(query, [p_role,user_id]);
        console.log(result[0]);
        return result[0];
    } catch (error) {
        logger.error('Getting all personalize and instructor recommendations erorr at service: ');
        console.error(error);
        return error;
    }
}

export default {
  registerUser,
  loginUser,
  logoutUser,
  getUser,
  getActiveUser,
  changeUserPass,
  getMyBorrowedBooks,
  userContribute,
  getUserContributions,
  addInstructorRecommendations,
  getPersonalizeInstructorRecommendations,
};
