// Object returned on insert and update database
export default interface IMySQLResult {
  insertId: number;
  message: string;
  status: number;
  affectedRows: number;
  changedRows: number;
  fieldCount: number;
  info: string;
  serverStatus: number;
  warningStatus: number;
}
