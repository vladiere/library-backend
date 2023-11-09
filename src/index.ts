import path from "path";
import cors from "cors";
import morgan from "morgan";
import logger from "./config/logger";
import bodyParser from "body-parser";
import express, { Express } from "express";
import { initializeWebSocket } from './config/websocket'
import bookRoutes from "./routes/book.route";
import authRoute from "./routes/auth.route";
import authorRoute from "./routes/author.route";
import publisherRoute from "./routes/publisher.route";
import librarianRoute from "./routes/librarian.route";
import refreshTokenRoute from "./routes/refreshToken.route";
import userRoute from "./routes/user.route";
import circulationRoute from "./routes/circulation.route";
import notificationsRoute from "./routes/notifications.route";
import transactionRoute from "./routes/transaction.route";
import { Server as HttpServer } from "http";

const app: Express = express();
const PORT: number = Number(process.env.PORT) || 3000;
const httpServer = new HttpServer(app);

// Logging
app.use(morgan("dev"));

// Parse the request
app.use(express.urlencoded({ extended: false }));

// Takes care of json data
app.use(express.json({ limit: "100mb" })); // Setting the data size of an json
app.use(bodyParser.json());
app.use(cors());

app.use(express.static(path.join(__dirname, "public")));

// Setting the cors policy
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept, Authorization",
  );
  // Setting the cors method headers
  if (req.method === "OPTIONS") {
    res.header("Access-Control-Allow-Methods", "PUT, GET, PATCH, DELETE, POST");
    return res.status(200).json({});
  }
  next();
});

// Routes here
app.use("/api/", bookRoutes);
app.use("/api/", authRoute);
app.use("/api/", publisherRoute);
app.use("/api/", librarianRoute);
app.use("/api/", authorRoute);
app.use("/api/", refreshTokenRoute);
app.use("/api/", userRoute);
app.use("/api/", circulationRoute);
app.use("/api/", notificationsRoute);
app.use("/api/", transactionRoute);

// Error Handling
app.use((req, res, next) => {
  const error = new Error("Not Found");
  return res.status(404).json({
    message: error.message,
  });
});

initializeWebSocket(httpServer);

httpServer.listen(PORT, "0.0.0.0", () => {
  logger.info(`Server listening on Port ${PORT}`);
});
