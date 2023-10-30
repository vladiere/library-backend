import { Request, Response } from "express";
import notificationsService from "../services/notifications.service";
import logger from "../config/logger";

const getLibrarianNotifications = async (req: Request, res: Response) => {
  try {
    const result = await notificationsService.getLibrarianNotifications();
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Getting librarian notifications error at controller');
    console.error(error);
    return res.status(500).json(error)
  }
};

const clearAllLibrarianNotifications = async (req: Request, res: Response) => {
  try {
    const result = await notificationsService.clearAllLibrarianNotifications();
    return res.status(201).json(result);
  } catch (error: any) {
    logger.error('Clearing all librarian notifications error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
};

const getUserNotifications = async (req: Request, res: Response) => {
  try {
    const { user_id } = req.body;
    const result = await notificationsService.getUserNotifications(user_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Getting user notifications error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
};

const clearAllUserNotifications = async (req: Request, res: Response) => {
  try {
    const { user_id, notification_id } = req.body;
    const result = await notificationsService.clearAllUserNotification(notification_id, user_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Clearing all user notification error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
}

export default {
  getLibrarianNotifications,
  clearAllLibrarianNotifications,
  getUserNotifications,
  clearAllUserNotifications
}
