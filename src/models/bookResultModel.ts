type IBookResult = Record<
  string,
  {
    "Accession No": string;
    "Date Received": string;
    Author: string;
    Edition: string;
    Volumes: number;
    Publisher: string;
    "Copyright Yr": string;
    Remarks: string;
  }[]
>;

export default IBookResult;
