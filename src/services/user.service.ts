import { Connect, Query } from "../config/mysql";
import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";
import IUser from "../models/userModel";
import bcryptjs from "bcryptjs";
import signedJWT from "@functions/signedJWT";

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

// const loginUser = async (
//   username: string,
//   password: string,
// ): Promise<string | any> => {
//   let query = "CALL AccessLibrarianLogin(?);";
//
//   try {
//     const connection = await Connect();
//     const users: any = await Query<IUser[]>(connection, query, [username]);
//     connection.end();
//
//     if (users[0][0].status === 404) {
//       // Reject the Promise with an error message
//       throw new Error(users[0][0].message);
//     }
//
//     const result = await new Promise((resolve, reject) => {
//       bcryptjs.compare(password, users[0][0].password, (error, result) => {
//         if (error) {
//           logger.error(error);
//           // Reject the Promise with an error object
//           reject({
//             message: error.message,
//             error,
//             status: 500,
//           });
//         } else if (result) {
//           signedJWT(users[0], (_error, accessToken, refreshToken) => {
//             if (_error) {
//               LoginLibrarian(username, "login unable");
//               // Reject the Promise with an error object
//               reject({
//                 message: "Unable to SIGN Token",
//                 error: _error,
//                 status: 401,
//               });
//             } else if (accessToken && refreshToken) {
//               LoginLibrarian(username, "Success");
//
//               // Resolve the Promise with the desired value
//               resolve({
//                 librarian_id: users[0][0].librarian_id,
//                 privilege: users[0][0].privilege,
//                 accessToken,
//                 refreshToken,
//               });
//             }
//           });
//         } else {
//           LoginLibrarian(username, "Failed");
//           // Reject the Promise with an error object
//           reject({
//             message: "Login failed wrong password",
//             status: 500,
//           });
//         }
//       });
//     });
//
//     return result; // Resolve the Promise with the result
//   } catch (error: any) {
//     logger.error("Connection Error");
//     console.error(error);
//     // Reject the Promise with an error object
//     throw {
//       message: error.message,
//       error,
//       status: 500,
//     };
//   }
// };

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
}

export default {
  registerUser,
}
