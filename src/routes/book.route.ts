import express from "express";
import bookController from "../controllers/book.controller";
import verifyToken from "../middlewares/verifyToken";
import { upload } from "../middlewares/multerUpload";
import uploadImage from "../config/multer";

const router = express.Router();

// Read excel and convert into json
router.post(
  "/upload/excel",
  verifyToken,
  upload.single("exceldata"),
  bookController.uploadExcel,
);

// --------------------------------------------------------------------------------
// Bulk upload of Book records
router.post(
  "/upload/bulk/record",
  verifyToken,
  bookController.bulkUploadRecords,
);
// Upload book record/s
router.post("/add/book/record", verifyToken, uploadImage.single("file_img"), bookController.singleAddRecord);
// Get book/s
router.get("/get/all/books", verifyToken, bookController.getAllBooksRecord);
// get all books inventory
router.post(
  "/get/all/books/inventory",
  verifyToken,
  bookController.getAllBookInventory,
);
// get one book only
router.post(
  "/get/single/book",
  verifyToken,
  bookController.getSingleBookRecord,
);
// update book image
router.post(
  "/upload/book/image",
  verifyToken,
  uploadImage.single("image"),
  bookController.addBookImage,
);
// update a book
router.post(
  "/update/book/record",
  verifyToken,
  bookController.updateBookRecord,
);
// update a book copy
router.post(
  "/update/book/copies",
  verifyToken,
  bookController.manageBookCopies,
);
// add a book catalog
router.post("/add/book/catalog", verifyToken, bookController.addCatalog);
// get all cotalogs
router.get(
  "/get/all/book/catalog",
  verifyToken,
  bookController.getAllBookCatalog,
);
// adding library acquisition
router.post(
  "/add/book/acquisition",
  verifyToken,
  bookController.addBookAcquisition,
);
// get all library acquisitions
router.get(
  "/get/library/acquisitions",
  verifyToken,
  bookController.getAllBookAcquisition,
);

export = router;
