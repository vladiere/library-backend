import multer from "multer";
import path from "path";

const storage = multer.diskStorage({
  destination: (req, file, callback) => {
    callback(null, path.join(__dirname, "../public/downloads"));
  },
  filename: (req, file, callback) => {
    callback(
      null,
      file.fieldname + "-" + Date.now() + path.extname(file.originalname),
    );
  },
});

const uploadFile = multer({ storage: storage });

export default uploadFile;
