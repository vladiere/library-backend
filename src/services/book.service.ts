import logger from "../config/logger";
import { Connect, Query } from "../config/mysql";
import { executeQuery } from "../functions/executeQuery";
import IAcquisition from "../models/acquisitionModel";
import NewIBook from "../models/bookModel";
import IBooksRecord from "../models/bookModel";

const bulkUpload = async (bookRecords: string): Promise<any> => {
  try {
    let result: any = "";
    const newBookRecords = JSON.parse(bookRecords);

    for (const item of newBookRecords) {
        const accession_no = parseInt(item['accession no.']);
        const date_received = item['date received'];
        const title = item['title of the book'];
        const author = item.author;
        const edition = item.edition;
        const publisher = item.publisher;
        const cost = item['cost price'] ? item['cost price'] : "0";
        const copyright_yr = item['copyright yr.'];
        const remarks = item.remarks;
        
        const query = `CALL AddBook(${accession_no},"${date_received}","${title}","${author}","${edition}","${publisher}","${cost}","${copyright_yr}","${remarks}","")`

        const connection = await Connect();
        result = await Query(connection, query);
    }
    return result;

  } catch (error: any) {
    logger.error("Inserting Bulk records Error: ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};

const addOneBook = async (bookRecord: NewIBook, book_img_path: string) => {
  try {
    const query = "CALL AddBook(?,?,?,?,?,?,?,?,?,?);";

    const result: any = await executeQuery(query, [
      bookRecord.accession_no,
      bookRecord.date_received,
      bookRecord.title_of_the_book,
      bookRecord.author,
      bookRecord.edition,
      bookRecord.publisher,
      bookRecord.cost_price,
      bookRecord.copyright_yr,
      bookRecord.remarks,
      book_img_path,
    ]);

    return result[0][0];
  } catch (error: any) {
    logger.error("Adding book Error: ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};

const getAllBooksRecord = async () => {
  try {
    const query = "SELECT * FROM book_info;";

    const result = await executeQuery(query);

    return result;
  } catch (error: any) {
    logger.error("Getting all books records Error : ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};

const getAllBookInventory = async (limit: number, book_id?: number) => {
  try {
    let query = "";

    if (limit === 0) {
      query = "SELECT * FROM book_inventory;";
    } else {
      query = `SELECT * FROM book_inventory LIMIT ${limit};`;
    }

    if (book_id) {
      query = `SELECT * FROM book_inventory WHERE book_id = ${book_id} LIMIT 1;`;
    }

    const result = await executeQuery(query);

    return result;
  } catch (error: any) {
    logger.error("Getting all books records Error : ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};

const getSingleBookRecord = async (book_id: number) => {
  try {
    const query = `SELECT * FROM book_info WHERE book_id = ? LIMIT 1;`;

    const result = await executeQuery(query, [book_id]);

    return result;
  } catch (error: any) {
    logger.error("Getting single book records Error : ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};

const manageBookCopies = async (option: string, copies: number, book_id: number) => {
  try {
    const query = "CALL ManageBookCopies(?,?,?)";
    
    const result = await executeQuery(query, [option, copies, book_id]);

    return result;
  } catch (error: any) {
    logger.error("Updating books copies Error : ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};

const addBookImage = async (img_path: string, book_id: any) => {
  try {
    const query = `UPDATE book_image SET img_path = '${img_path}' WHERE book_id = ${book_id}`;

    const result: any = await executeQuery(query);

    if (result.affectedRows === 1) {
      return { message: "Book Image Updated Successfully" };
    } else {
      return result;
    }
  } catch (error: any) {
    logger.error("Adding book image Error : ");
    console.error(error);

    return {
      message: error.message,
      error,
    };
  }
};

const updateBookRecord = async (
  book_record: NewIBook,
): Promise<NewIBook | any> => {
  try {
    const query = `CALL UpdateBookRecord(${book_record.book_id},'${book_record.edition}',${book_record.cost_price}, '${book_record.remarks}');`;

    const result: any = await executeQuery(query);

    return result[0][0];
  } catch (error: any) {
    logger.error("Update book record Error : ");
    console.error(error.message, error);
    return {
      message: error.message,
      error,
    };
  }
};

const addCatalog = async (
  accession_id: number,
  book_subject: string,
  ddc_code: string,
) => {
  try {
    const query = "CALL AddBookCatalog(?,?,?);";

    const result: any = await executeQuery(query, [
      accession_id,
      book_subject,
      ddc_code,
    ]);

    return result[0][0];
  } catch (error: any) {
    logger.error("Adding book catalog Error : ");
    console.error(error);

    return {
      message: error.message,
      error,
    };
  }
};

const getAllBookCatalog = async () => {
  try {
    const query = "SELECT * FROM book_catalog_info;";

    const result = await executeQuery(query);

    return result;
  } catch (error: any) {
    logger.error("Getting all book catalog Error in service: ");
    console.error(error);
    return error;
  }
};

const addBookAcquisition = async (book_acquisition: IAcquisition) => {
  try {
    const query = `CALL AddLibraryAcquisitions(${book_acquisition.accession_no}, '${book_acquisition.accession_date}', '${book_acquisition.title}', '${book_acquisition.source}', ${book_acquisition.cost}, '${book_acquisition.condition}', '${book_acquisition.notes}');`;

    const result: any = await executeQuery(query);

    return result[0][0];
  } catch (error: any) {
    logger.error("Adding book acquisition error in service: ");
    console.error(error);
    return error;
  }
};

const getAllBookAcquisition = async () => {
  try {
    const query = "SELECT * FROM book_acquisitions";

    const result = await executeQuery(query);

    return result;
  } catch (error: any) {
    logger.error("Getting all library acquisition error on service:");
    console.error(error);
    return error;
  }
};

export default {
  addOneBook,
  bulkUpload,
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
