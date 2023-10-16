import bcryptjs from "bcryptjs";
import signedJWT from "../functions/signedJWT";
import ILibrarian from "../models/userModel";
import { Connect, Query } from "../config/mysql";
import LoginLibrarian from "../functions/loginLibrarian";
import IMySQLResult from "src/models/resultModel";
import logger from "../config/logger";
import IUser from "../models/userResultModel";
import { executeQuery } from "../functions/executeQuery";

const registerLibrarian = async (
  librarian: ILibrarian,
): Promise<ILibrarian | any> => {
  try {
    const hash = await bcryptjs.hash(librarian.password, 10);

    // Insert data to the database
    let query = "CALL AddLibrarian(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

    const connection = await Connect();
    const result = await Query<IMySQLResult>(connection, query, [
      librarian.firstname,
      librarian.middlename,
      librarian.lastname,
      librarian.email_address,
      librarian.phone_number,
      librarian.hobbies,
      librarian.description,
      librarian.street_address,
      librarian.city,
      librarian.state_province_region,
      librarian.postal_code,
      librarian.address_type,
      librarian.username,
      hash,
      librarian.privilege,
    ]);

    return result;
  } catch (error: any) {
    logger.error(`Registration Error: ${error.message}`);
    return {
      message: error.message,
      error,
      status: 500,
    };
  }
};

const loginLibrarian = async (
  username: string,
  password: string,
): Promise<string | any> => {
  let query = "CALL AccessLibrarianLogin(?);";

  try {
    const connection = await Connect();
    const users = await Query<IUser[]>(connection, query, [username]);
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
              LoginLibrarian(username, "login unable");
              // Reject the Promise with an error object
              reject({
                message: "Unable to SIGN Token",
                error: _error,
                status: 401,
              });
            } else if (accessToken && refreshToken) {
              LoginLibrarian(username, "Success");

              // Resolve the Promise with the desired value
              resolve({
                librarian_id: users[0][0].librarian_id,
                privilege: users[0][0].privilege,
                accessToken,
                refreshToken,
              });
            }
          });
        } else {
          LoginLibrarian(username, "Failed");
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

const logoutLibrarian = async (refresh_token: string) => {
  try {
    const query = "DELETE FROM refresh_token WHERE refresh_token = ?";

    const result: any = await executeQuery(query, [refresh_token]);

    if (result.affectedRows === 1) {
      return { message: "Logout Successfully" };
    } else {
      return result;
    }
  } catch (error: any) {
    logger.error("Logging out Librarian Error:");
    console.error(error);
    throw new Error(error);
  }
};

const changeUserPassword = async (password: string, librarian_id: number) => {
  try {
    const query = "CALL ChangeLibrarianPass(?,?)";
    const hash = await bcryptjs.hash(password, 10);
    const result: any = await executeQuery(query, [hash, librarian_id]);

    return result[0][0];
  } catch (error: any) {
    logger.error("Changing password on service error:");
    console.error(error);
    return error;
  }
};

const registerUser = async () => {
  try {
    
  } catch (error: any) {
    logger.error('Registration user error:')
    console.error(error)
    return error;
  }
}

export default {
  registerLibrarian,
  loginLibrarian,
  logoutLibrarian,
  changeUserPassword,
};
