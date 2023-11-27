export default interface IBook {
  "Accession No": number;
  "Date Received": string;
  Author: string;
  "Title of the Book": string;
  Edition: string;
  Volumes: number;
  Publisher: string;
  "Cost Price": string;
  "Copyright Yr": string;
  Remarks: string;
  Image: string;
}

export default interface IBooksRecord {
  'accession no': number;
  'date received': string;
  author: string;
  'title of the book': string;
  edition: string;
  volumes: string | number;
  'cost price': string;
  publisher: string;
  'copyright yr': string;
  remarks: string;
}

export default interface NewIBook {
  accession_id: number;
  accession_no: number;
  book_id: number;
  date_received: string;
  author: string;
  title_of_the_book: string;
  edition: string;
  volumes: number;
  publisher: string;
  cost_price: number;
  copyright_yr: string;
  remarks: string;
}
