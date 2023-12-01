import { Request, Response } from 'express';
import recoveryService from '../services/recovery.service';
import logger from '../config/logger';

const sendEmailResetPassword = async (req: Request, res: Response) => {
  try {
    const { email_address } = req.body;
    const result = await recoveryService.sendEmailResetPassword(email_address);
    return res.status(200).json(result);
  } catch (error) {
    logger.error('Sending email reset token error at controller: ');
    console.error(error);
    return res.status(500).json(error);
  }
}

const resetPassword = async (req: Request, res: Response) => {
  try {
    const { email, password } = req.body;
    const result = await recoveryService.resetPassword(email,password);
    return res.status(200).json(result);
  } catch (error) {
    logger.error('Reseting password error at controller: ');
    console.error(error);
    return res.status(500).json(error);
  }
}

export default {
  sendEmailResetPassword,
  resetPassword,
}
