import cors from "cors";
import path from "path";
import morgan from "morgan";
import logger from "./config/logger";
import bodyParser from "body-parser";
import express, { Express } from "express";
import bookRoutes from "./routes/book.route";
import authRoute from "./routes/auth.route";
import authorRoute from "./routes/author.route";
import publisherRoute from "./routes/publisher.route";
import librarianRoute from "./routes/librarian.route";
import refreshTokenRoute from "./routes/refreshToken.route";

const app: Express = express();
const PORT: number = Number(process.env.PORT) || 3000;

// Logging
app.use(morgan("dev"));

// Parse the request
app.use(express.urlencoded({ extended: false }));

// Takes care of json data
app.use(express.json({ limit: "50mb" })); // Setting the data size of an json
app.use(bodyParser.json());
app.use(cors());

app.use(express.static(path.join(__dirname, "public")));

// Routes here
app.use("/api/", bookRoutes);
app.use("/api/", authRoute);
app.use("/api/", publisherRoute);
app.use("/api/", librarianRoute);
app.use("/api/", authorRoute);
app.use("/api/", refreshTokenRoute);

// Error Handling
app.use((req, res, next) => {
  const error = new Error("Not Found");
  return res.status(404).json({
    message: error.message,
  });
});

app.listen(PORT, "0.0.0.0", () => {
  logger.info(`Server listening on Port ${PORT}`);
});
