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
import allRoute from "./routes/all.route";
import recoveryRoute from './routes/recovery.route';
import contributorsRoute from './routes/contributors.route';
import { Server as HttpServer } from "http";

const app: Express = express();
const PORT: number = Number(process.env.PORT) || 3000;
const httpServer = new HttpServer(app);
const allowedOrigins = ['https://cpclibrary.online', 'http://localhost:9300', 'http://localhost:9000', 'http://localhost:9200'];

const corsOptions = {
  origin: (origin: any, callback: any) => {
    if (!origin || allowedOrigins.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error('Not allowed origin'));
    }
  }
}

// Logging
app.use(morgan("dev"));

// Parse the request
app.use(express.urlencoded({ extended: false }));

// Takes care of json data
app.use(express.json({ limit: "100mb" })); // Setting the data size of an json
app.use(bodyParser.json());
app.use(cors(corsOptions));

app.use(express.static(path.join(__dirname, "public")));

// Setting the cors policy
// app.use((req, res, next) => {
//   res.header("Access-Control-Allow-Origin", "https://cpclibrary.online, http://localhost:9300");
//   res.header(
//     "Access-Control-Allow-Headers",
//     "Origin, X-Requested-With, Content-Type, Accept, Authorization",
//   );
//   // Setting the cors method headers
//   if (req.method === "OPTIONS") {
//     res.header("Access-Control-Allow-Methods", "PUT, GET, PATCH, DELETE, POST");
//     return res.status(200).json({});
//   }
//   next();
// });

// Default route
app.get('/', (req, res) => {
  return res.status(200).json({ message: 'OK' });
})

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
app.use("/api/", allRoute);
app.use("/api/", recoveryRoute);
app.use("/api/", contributorsRoute);

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
