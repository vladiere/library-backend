import dotenv from "dotenv";
import path from "path";

dotenv.config();

const MYSQL_HOST = process.env.MYSQLHOST || "localhost";
const MYSQL_USER = process.env.MYSQLUSER || "root";
const MYSQL_PASS = process.env.MYSQLPASSWORD || "31N$t31n";
const MYSQL_DATABASE = process.env.MYSQL_DATABASE || "cpclibrary";

const MYSQL = {
  host: MYSQL_HOST,
  database: MYSQL_DATABASE,
  user: MYSQL_USER,
  pass: MYSQL_PASS,
};

const SERVER_HOST = process.env.HOST || "localhost";
const SERVER_PORT = process.env.MYSQL_PORT || 3306;
const SERVER_ACCESS_TOKEN_EXPIRETIME = process.env.SERVER_ACCESS_TOKEN_EXPIRETIME || "5m";
const SERVER_REFRESH_TOKEN_EXPIRETIME = process.env.SERVER_REFRESH_TOKEN_EXPIRETIME || "10800s";
const SERVER_TOKEN_ISSUER = process.env.SERVER_TOKEN_ISSUER || "MIT";
const SERVER_SECRET_KEY = process.env.SERVER_SECRET_KEY || "cpcEncryptedSecretKey";
const SERVER_REFRESH_SECRET_KEY = process.env.SERVER_REFRESH_SECRET_KEY || "cpcEncryptedSecretKey";

const SERVER_RESET_SECRET_KEY = process.env.SERVER_RESET_SECRET_KEY || 'cpcEncryptedSecretKey';
const SERVER_RESET_EXPIRETIME = process.env.SERVER_RESET_EXPIRETIME || '30m';

const MYSQL_URL = `mysql://${MYSQL_USER}:${MYSQL_PASS}@${MYSQL_HOST}:${SERVER_PORT}/${MYSQL_DATABASE}`

const SERVER = {
  hostname: SERVER_HOST,
  port: SERVER_PORT,
  token: {
    refreshTokenExpireTime: SERVER_REFRESH_TOKEN_EXPIRETIME,
    accessTokenExpireTime: SERVER_ACCESS_TOKEN_EXPIRETIME,
    issuer: SERVER_TOKEN_ISSUER,
    accessSecret: SERVER_SECRET_KEY,
    refreshSecret: SERVER_REFRESH_SECRET_KEY,
    resetAccessSecret: SERVER_RESET_SECRET_KEY,
    resetTokenExpireTime: SERVER_RESET_EXPIRETIME,
  },
};

const config = {
  mysql: MYSQL,
  server: SERVER,
  imgDir: path.join(__dirname, "../public/images"),
  mysqlurl: MYSQL_URL
};

export default config;
