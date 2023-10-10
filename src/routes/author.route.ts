import express from "express";
import authorController from "../controllers/author.controller";
import verifyToken from "../middlewares/verifyToken";

const router = express.Router();

// --------------------------------------------------------------------------------
// Get author/s
router.get(
  "/get/all/authors",
  verifyToken,
  authorController.getAllAuthorRecords,
);
router.post(
  "/get/single/author",
  verifyToken,
  authorController.getSingleAuthorRecord,
);

export = router;
