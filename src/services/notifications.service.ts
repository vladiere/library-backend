import logger from "../config/logger";
import { executeQuery } from "../functions/executeQuery";

const clearAllLibrarianNotifications = async () => {
  try {
    const query = "CALL ClearLibrarianNotifications(?)";
    const result: any = await executeQuery(query, [0]);
    return result[0][0];
  } catch (error: any) {
    logger.error("Clearing all librarian notifications error at service");
    console.error(error);
    return error;
  }
};

const getLibrarianNotifications = async () => {
  try {
    const query =
      "SELECT * FROM notification_librarian ORDER BY notification_date DESC";
    const result = await executeQuery(query);
    return result;
  } catch (error: any) {
    logger.error("Getting librarian notifications error at service");
    console.error(error);
    return error;
  }
};

const getUserNotifications = async (user_id: number) => {
  try {
    const query = "SELECT * FROM user_notifications WHERE user_id = ?";
    const result = await executeQuery(query, [user_id]);
    return result;
  } catch (error: any) {
    logger.error("Getting user notification error at service");
    console.error(error);
    return error;
  }
};

const clearAllUserNotification = async (
  notification_id: number,
  user_id: number,
) => {
  try {
    const query = "CALL ClearUserNotifications(?,?)";
    const result = await executeQuery(query, [0, user_id]);
    return result;
  } catch (error) {
    logger.error("Clearing all user notification error at service");
    console.error(error);
    return error;
  }
};

export default {
  clearAllLibrarianNotifications,
  getLibrarianNotifications,
  clearAllUserNotification,
  getUserNotifications,
};
