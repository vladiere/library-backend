import logger from "../config/logger";
import { Request, Response } from "express";
import Jimp from "jimp";
import Tesseract from "tesseract.js";
import path from "path";

const handleImagesComparison = async (req: Request, res: Response) => {
  try {
    if (!req.file) {
      console.error("No image selected.");
      return res.status(404).json({ message: "No image found" });
    }

    // Read the uploaded image from the request
    const studentIDImageBuffer = req.file.filename;
    const studentIDImageFullPath = path.join(__dirname, "../public/images/");

    // Load the dummy image (replace with the correct path or buffer)
    const dummyImageFullPath = path.join(
      __dirname,
      "../public/dummies/student-front.jpg",
    );
    const dummyImageBuffer = await Jimp.read(dummyImageFullPath);

    // Compare the images using Jimp
    const studentIDImage = await Jimp.read(
      studentIDImageFullPath + studentIDImageBuffer,
    );
    const dummyImage = await Jimp.read(dummyImageBuffer);

    const diff = Jimp.diff(studentIDImage, dummyImage);
    const percentDiff = diff.percent;

    console.log("Image similarity:", percentDiff);

    if (percentDiff >= 0.7) {
      console.log("Student ID image matches the dummy image.");

      // Recognize text from the student ID image
      const {
        data: { text },
      } = await Tesseract.recognize(
        studentIDImageFullPath + studentIDImageBuffer,
        "eng",
      );

      if (text) {
        // Define a regular expression to match capitalized words, single letters with a dot, and numbers with more than three digits
        const regex = /[A-Z][A-Z]+|[A-Z]\.|\b\d{4,}\b/g;

        // Use the regular expression to find matches in the input text
        const matches = text.match(regex);

        // Define the words and phrases to remove
        const wordsAndPhrasesToRemove = [
          "CORDOVA",
          "PUBLIC",
          "PUB",
          "LIC",
          "COL",
          "LEGE",
          "COLLEGE",
          "STUDENT",
          "NAME",
          "STUDENT NAME",
          "ID",
          "ID NUMBER",
          "BER",
        ];

        // Filter out the words and phrases to remove
        const filteredMatches = matches?.filter(
          (match) => !wordsAndPhrasesToRemove.includes(match),
        );

        // Define the array to store the filtered elements
        const filteredArray: any = [];

        // Iterate through the filtered matches and add them to the array
        filteredMatches?.forEach((match) => {
          // Filter out non-alphanumeric characters
          const alphanumericMatch = match.replace(/[^A-Z\d.]/g, "");
          // Add to the array if not empty
          if (alphanumericMatch.length > 0) {
            filteredArray.push(alphanumericMatch);
          }
        });
        console.log(filteredArray);
        return res.status(200).json({status: 200, filteredArray});
      } else {
        console.log("No text detected in the student ID image.");
        return res.status(200).json({status: 400, message: "Invalid ID image" });
      }
    } else {
      console.log("Student ID image does not match the dummy image.");
      return res.status(400).json({ message: "Invalid ID image" });
    }
  } catch (error) {
    logger.error("Image compare error:", error);
    console.log(error);
    return res
      .status(500)
      .json({ message: "Internal server error", error: error });
  }
};

export default { handleImagesComparison };
