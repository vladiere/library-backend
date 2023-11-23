import { Request, Response } from "express";
import userService from "../services/user.service";
import logger from "../config/logger";

const registerUser = async (req: Request, res: Response) => {
  try {
    const { form } = req.body;
    const result = await userService.registerUser(form);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Register use in controller Error: ");
    console.error(error);
    return res.status(500).json({ error, message: error.message });
  }
};

const loginUser = async (req: Request, res: Response) => {
  try {
    const { form } = req.body;

    const result = await userService.loginUser(form.email, form.password);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Logging in user error at controller");
    console.error(error);
    return res.status(500).json(error);
  }
};

const getUser = async (req: Request, res: Response) => {
  try {
    const { user_id } = req.body;

    const result = await userService.getUser(user_id);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting user details error at controller");
    console.error(error);
    return res.status(500).json(error);
  }
};

const getActiveUser = async (req: Request, res: Response) => {
  try {
    const result = await userService.getActiveUser();

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting active users error at controller");
    console.error(error);
    return res.status(500).json(error);
  }
};

const logoutUser = async (req: Request, res: Response) => {
  try {
    const { refreshToken } = req.body;

    const result = await userService.logoutUser(refreshToken);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Logging out user error on controller");
    console.error(error);
    return res.status(500).json(error);
  }
};

const changeUserPass = async (req: Request, res: Response) => {
  try {
    const { email, password } = req.body;

    const result = await userService.changeUserPass(email, password);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Changing password error at controller");
    console.error(error);
    return res.status(500).json(error);
  }
};

const getMyBorrowedBooks = async (req: Request, res: Response) => {
  try {
    const { user_id } = req.body;
    const result = await userService.getMyBorrowedBooks(user_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting my borrowed books error at controller");
    console.error(error);
    return res.status(500).json(error);
  }
};

const userContribute = async (req: Request, res: Response) => {
  try {
    if (!req.file) {
      return res.status(500).json({ message: "No file uploaded" });
    }
    const file_book = req.file;
    console.log(req.file);
    const { user_id, file_title, file_author, file_category, file_publisher, file_description } = req.body;
    const result = await userService.userContribute(
      user_id,
      file_book.filename,
      file_title,
      file_author,
      file_category,
      file_publisher,
      file_description
    );
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Contributing user error at controller");
    console.error(error);
    return res.status(500).json(error);
  }
};

const getUserContributions = async (req: Request, res: Response) => {
  try {
    const { user_id } = req.body;
    const result = await userService.getUserContributions(user_id);
    return res.status(200).json(result);
  } catch (error: any) {
    logger.error('Getting user contribution error at controller');
    console.error(error);
    return res.status(500).json(error);
  }
}

const addInstructorRecommendations = async (req: Request, res: Response) => {
    try {
        const { user_id, book_id } = req.body;
        const result = await userService.addInstructorRecommendations(user_id,book_id);
        return res.status(200).json(result);
    } catch (error) {
        logger.error('Adding instructor recommendations error at controller: ');
        console.error(error);
        return res.status(500).json(error);
    }
}

const getPersonalizeInstructorRecommendations = async (req: Request, res: Response) => {
    try {
        const { p_role, user_id } = req.body;
        const result = await userService.getPersonalizeInstructorRecommendations(p_role,user_id);
        return res.status(200).json(result);
    } catch (error) {
        logger.error('Getting all personalize and instructor recommendations error at controller: ');
        console.error(error);
        return res.status(500).json(error);
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
