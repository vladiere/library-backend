import express from "express";
import authorController from "../controllers/author.controller";
import verifyToken from "../middlewares/verifyToken";
import publisherController from "../controllers/publisher.controller";

const router = express.Router();

// --------------------------------------------------------------------------------
// Get publisher/s
router.get(
  "/get/all/publishers",
  verifyToken,
  publisherController.getAllPublisherRecords,
);
router.post(
  "/get/single/publisher",
  verifyToken,
  publisherController.getSinglePublisherRecord,
);

export = router;
