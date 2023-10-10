import { Connect, Query } from "../config/mysql";
import logger from "../config/logger";
import IMySQLResult from "../models/resultModel";

const LoginLibrarian = (username: string, login_status: string) => {
  const query = `CALL LoginLibrarian('${username}', '${login_status}');`;
  Connect()
    .then((connection) => {
      Query<IMySQLResult[]>(connection, query)
        .then((result) => {
          if (result[0].message) {
            return result[0].message;
          }
          return result[0].message;
        })
        .catch((error) => {
          logger.error("Error query " + error.message);
          return {
            message: error.message,
            error,
          };
        });
    })
    .catch((error) => {
      logger.error("Error query " + error.message);
      return {
        message: error.message,
        error,
      };
    });
};

export default LoginLibrarian;
