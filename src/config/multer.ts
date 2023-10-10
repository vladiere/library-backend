import multer from "multer";
import path from "path";
import config from "./config";

const storage = multer.diskStorage({
  destination: (req, file, callback) => {
    callback(null, config.imgDir);
  },
  filename: (req, file, callback) => {
    callback(
      null,
      file.fieldname + "-" + Date.now() + path.extname(file.originalname),
    );
  },
});

const uploadImage = multer({ storage: storage });

export default uploadImage;
