import XLSX from "xlsx";

const readExcelFileService = (excelFile: Express.Multer.File) => {
  return new Promise((resolve, reject) => {
    if (!excelFile) {
      reject({ message: "No file uploaded" });
    } else {
      const workbook = XLSX.read(excelFile.buffer, { type: "buffer" });
      const sheet = workbook.Sheets["Sheet1"];
      const jsonData = XLSX.utils.sheet_to_json(sheet);
      resolve(jsonData);
    }
  });
};

export = readExcelFileService;
