import { Request, Response, NextFunction } from "express";
import logger from "../config/logger";
import readExcelFileService from "../services/excel.service";
import bookService from "../services/books.service";

const uploadExcel = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const excelFile = req.file;

    if (!excelFile) {
      return res.status(400).json({ message: "No file uploaded" });
    }

    const jsonData = await readExcelFileService(excelFile);

    res.status(200).json({ message: "File uploaded successfully", jsonData });
  } catch (error) {
    console.error(`File Error: ${error}`);
    next(error);
  }
};

const singleAddRecord = async (req: Request, res: Response) => {
  try {
    const { records } = req.body;

    const result = await bookService.addOneBook(records);

    return res.status(200).json(result);
  } catch (error) {
    logger.error("Error adding record : ");
    console.error(error);
    return res.status(500).json({ error });
  }
};

const bulkUploadRecords = async (req: Request, res: Response) => {
  try {
    const { jsonRecords } = req.body;

    const result = await bookService.bulkUpload(jsonRecords);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Bulk Upload Error : ");
    console.error(error.message);
    return res.status(500).json({ error });
  }
};

const getAllBooksRecord = async (req: Request, res: Response) => {
  try {
    const result = await bookService.getAllBooksRecord();

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting all books record Error : ");
    console.error(error.message);
    return res.status(500).json({ error });
  }
};

const getAllBookInventory = async (req: Request, res: Response) => {
  try {
    type RequestInventoryBody = {
      limit: number;
      book_id?: number;
    };
    let result: any;

    const body: RequestInventoryBody = req.body;

    if (body.book_id) {
      result = await bookService.getAllBookInventory(body.limit, body.book_id);
    } else {
      result = await bookService.getAllBookInventory(body.limit);
    }

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting all books record Error : ");
    console.error(error.message);
    return res.status(500).json({ error });
  }
};

const getSingleBookRecord = async (req: Request, res: Response) => {
  try {
    const { id } = req.body;

    const result = await bookService.getSingleBookRecord(id);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting single book record Error : ");
    console.error(error.message);
    return res.status(500).json({ error });
  }
};

const manageBookCopies = async (req: Request, res: Response) => {
  try {
    const { copies, book_id, options } = req.body;

    const result = await bookService.manageBookCopies(options, copies, book_id);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Adding book copies Error : ");
    console.error(error.message);
    return res.status(500).json({ error });
  }
};

const addBookImage = async (req: Request, res: Response) => {
  try {
    if (!req.file) {
      return res.status(400).json({ message: "No file uploaded" });
    }

    const fileData = req.file;
    const { book_id } = req.body;
    console.log(fileData);

    const result = await bookService.addBookImage(
      fileData.filename,
      parseInt(book_id),
    );

    return res.status(200).json(result);
  } catch (error) {
    logger.error("Uploading book image Error : ");
    console.error(error);

    return res.status(500).json(error);
  }
};

const updateBookRecord = async (req: Request, res: Response) => {
  try {
    const { book_record } = req.body;

    const result = await bookService.updateBookRecord(JSON.parse(book_record));

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Updating book record Error : ");
    console.error(error.message);
    return res.status(500).json({ error });
  }
};

const addCatalog = async (req: Request, res: Response) => {
  try {
    const { book_catalog } = req.body;
    console.log(req.body);

    const result = await bookService.addCatalog(
      book_catalog.accession_id,
      book_catalog.book_subject,
      book_catalog.ddc_code,
    );

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Adding book catalog controller Error : ");
    console.error(error);
    return res.status(500).json(error);
  }
};

const getAllBookCatalog = async (req: Request, res: Response) => {
  try {
    const result = await bookService.getAllBookCatalog();

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting all book catalog error in controller: ");
    console.error(error);
    return res.status(500).json(error);
  }
};

const addBookAcquisition = async (req: Request, res: Response) => {
  try {
    const { book_acquisition } = req.body;

    const result = await bookService.addBookAcquisition(book_acquisition);

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Adding book acquisition error in controller:");
    console.error(error);
    return res.status(500).json(error);
  }
};

const getAllBookAcquisition = async (req: Request, res: Response) => {
  try {
    const result = await bookService.getAllBookAcquisition();

    return res.status(200).json(result);
  } catch (error: any) {
    logger.error("Getting all acquisition error in controller");
    console.error(error);
    return res.status(500).json(error);
  }
};

export default {
  uploadExcel,
  singleAddRecord,
  bulkUploadRecords,
  getAllBooksRecord,
  getAllBookInventory,
  getSingleBookRecord,
  manageBookCopies,
  addBookImage,
  updateBookRecord,
  addCatalog,
  getAllBookCatalog,
  addBookAcquisition,
  getAllBookAcquisition,
};
