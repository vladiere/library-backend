import jwt from "jsonwebtoken";
import config from "../config/config";
import logger from "../config/logger";
import IUser from "src/models/userResultModel";
import { executeQuery } from "./executeQuery";

const signedJWT = (
  user: any,
  callback: (
    error: Error | null,
    accessToken: string | null,
    refreshToken: string | null,
  ) => void,
): void => {
  logger.info(`Attempting to sign tokens for ${user[0].username || user[0].email_address}`);

  try {
    // Create the access token
    jwt.sign(
      {
        username: user[0].username || user[0].email_address,
        user_id: user[0].librarian_id || user[0].user_id,
        privilege: user[0]?.privilege,
      },
      config.server.token.accessSecret,
      {
        issuer: config.server.token.issuer,
        algorithm: "HS256",
        expiresIn: config.server.token.accessTokenExpireTime,
      },
      (error, accessToken) => {
        if (error) {
          callback(error, null, null);
        } else if (accessToken) {
          // Create the refresh token
          jwt.sign(
            {
              username: user[0].username || user[0].email_address,
              user_id: user[0].librarian_id || user[0].user_id,
              privilege: user[0]?.privilege,
            },
            config.server.token.refreshSecret,
            {
              issuer: config.server.token.issuer,
              algorithm: "HS256",
            },
            async (error, refreshToken) => {
              if (error) {
                callback(error, null, null);
              } else if (refreshToken) {
                // Insert the refresh token into the database
                await executeQuery(
                  `INSERT INTO refresh_token (username, refresh_token) VALUES('${user[0].username || user[0].email_address}','${refreshToken}')`,
                );
                callback(null, accessToken, refreshToken);
              }
            },
          );
        }
      },
    );
  } catch (error: any) {
    logger.error(error.message, error);
    callback(error, null, null);
  }
};

export default signedJWT;
