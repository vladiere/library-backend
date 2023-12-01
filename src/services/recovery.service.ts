import { executeQuery } from "../functions/executeQuery";
import bcryptjs from "bcryptjs";
import logger from "../config/logger";
import resetToken from '../functions/resetToken';
import { emailTemplate } from '../functions/email.template';

const sendEmailResetPassword = async (email: string) => {
  try {
    const foundEmail: any = await executeQuery(`SELECT COUNT(*) AS found_one FROM user_login WHERE email_address = '${email}'`);

    if (foundEmail.found_one === 0) {
      return {
        message: 'Email is not registered',
        status: 404,
      }
    }

    const result: any = await new Promise((resolve, reject) => {
      resetToken(email, (error, reset_token) => {
        if (error) {
          logger.error('Unable to sign token for reset');
          reject({
            message: 'Something is wrong, try again later.',
            status: 503,
          });
        } else if (reset_token) {
          resolve({ reset_token });
        }
      })
    });

    if (result) {
      await emailTemplate(result.reset_token, email);
      return {
        message: 'Request has been sent check your email now',
        status: 201,
      }
    }
  } catch (error) {
    logger.error('Sending emeeil resey password error at service: ');
    console.error(error);
    return error;
  }
}

const resetPassword = async (email: string, password: string) => {
  try {
    const hash = await bcryptjs.hash(password, 10);
    const query = "CALL ResetPassword(?,?)";

    const result: any = await executeQuery(query, [email,hash]);
    return result[0][0];
  } catch (error) {
    logger.error('Reseting password error at service: ');
    console.error(error);
    return error;
  }
}

export default {
  sendEmailResetPassword,
  resetPassword,
}
