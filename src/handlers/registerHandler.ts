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
    const role = req.body.role;

    // Read the uploaded image from the request
    const userIdImageBuffer = req.file.filename;
    const userIdImageFullPath = path.join(__dirname, "../public/images/");

    // Load the user ID image and enhance its quality
    const userIdImage = await Jimp.read(
      userIdImageFullPath + userIdImageBuffer,
    );

    // Apply image quality enhancements to the userIdImage
    userIdImage
      .contrast(0.7) // Adjust contrast (values between -1 and 1)
      .brightness(0.5) // Adjust brightness (values between -1 and 1)
      .quality(100); // Set quality to 100 for PNG

    // Convert the enhanced image to a buffer
    const enhancedImageBuffer = await userIdImage.getBufferAsync(Jimp.MIME_PNG);

    // Recognize text from the enhanced user ID image
    const {
      data: { text },
    } = await Tesseract.recognize(enhancedImageBuffer, "eng");

    if (text) {
      // Define a regular expression to match capitalized words, single letters with a dot, and numbers with more than three digits
      const regex = /[A-Z][A-Z]+|[A-Z]\.|\b\d{4,}\b/g;
      // Define regular expressions to match specific patterns
      const nameRegex = /[A-Z][A-Z]+/g; // Match capitalized words
      const idNumberRegex = /(\d{8})/g; // Match numbers with more than three digits

      // Match and extract the name, department, role, and ID number using regular expressions
      const nameMatches = text.match(nameRegex);
      const idNumberMatches = text.match(idNumberRegex);
      const departmentRegex = /(BSIT|BEED|BSHM|BSED|BSED-ENG|BSED-FIL|BSED-SCI|IT|EDUCATION|HM)\b/g; // Matches department codes

      // Define words and phrases to remove
      const wordsAndPhrasesToRemoveFromText = [ "REPUBLIC OF THE PHILIPPINES", "MUNICIPALITY OF CORDOVA", "CORDOVA PUBLIC COLLEGE", "ID NUMBER", ];

      // Filter out words and phrases to remove
      const filteredName = nameMatches?.filter(
        (match) => !wordsAndPhrasesToRemoveFromText.includes(match),
      );
      const filteredIdNumber = idNumberMatches?.filter(
        (match) => !wordsAndPhrasesToRemoveFromText.includes(match),
      );

      // Construct and return the extracted information
      const extractedInfo = {
        name: filteredName?.join(" ") || "Not Found",
        idNumber: filteredIdNumber?.join(" ") || "Not Found",
      };

      // Use the regular expression to find matches in the input text
      const matches = text.match(regex);
      const idNumbers = text.match(idNumberRegex);
      const departments = text.match(departmentRegex);

      // Define the words and phrases to remove
      const wordsAndPhrasesToRemove = [ "REPUBLIC", "OF", "THE", "PHILIPPINES", "CORDOVA", "PUBLIC", "COLLEGE", "MUNICIPALITY", "PUB", "LIC", "GABL", "CORDGVA", "CEBU", "6170", "COL", "LEGE", "NAME", "STUDENT NAME", "ID", "ID NUMBER", "ENG", "SCI", "SCIENCE", "FIL", "FILIPINO", "BER", "ID", "NUMBER", "SIGNATURE", "DEPARTMENT", "FOUNDED", "2005", "2008", ];

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
      const indexIdNumber = filteredArray.indexOf(idNumbers && idNumbers[0]);
      const indexDepartment = filteredArray.indexOf(
        departments && departments[departments.length - 1],
      );
      const roleIndex = filteredArray.indexOf(role.toUpperCase());
      const valueFromDepartmentToIdNumber = filteredArray.slice(
        indexDepartment,
        indexIdNumber,
      );
      const sortOrder = (value: string) => {
        // Check if the value is a department (e.g., IT, EDUCATION, HM, BEED, BSHM, BSED)
        if (departmentRegex.test(value)) {
          return -1; // Move departments to the beginning
        } else if (idNumberRegex.test(value)) {
          return 1; // Move ID numbers to the end
        }
        return 0; // Keep the order of other values
      };
      valueFromDepartmentToIdNumber.push(idNumbers && idNumbers[0]);
      valueFromDepartmentToIdNumber.sort(
        (a: any, b: any) => sortOrder(a) - sortOrder(b),
      );
      if (roleIndex !== -1) {
        if (role.toUpperCase() === 'STUDENT') { 
          const studentIndex = valueFromDepartmentToIdNumber.indexOf(role.toUpperCase())
          valueFromDepartmentToIdNumber.splice(studentIndex,1);
          return res
            .status(200)
            .json({ status: 200, valueFromDepartmentToIdNumber });  
        } else if (role.toUpperCase() === 'INSTRUCTOR' || role.toUpperCase() === 'FACULTY STAFF') {
          filteredArray.sort((a: string, b: string) => sortOrder(a) - sortOrder(b));
          filteredArray.splice(roleIndex,1);
          return res
            .status(200)
            .json({ status: 200, valueFromDepartmentToIdNumber: filteredArray });
        } else {
          return res.status(500).json({ message: 'Choose correct role' });
        }
      } else {
        return res.status(404).json({message: 'Invalid ID or Select your role'})
      }
    } else {
      console.log("No text detected in the user ID image.");
      return res.status(400).json({  message: "Invalid ID image" });
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
