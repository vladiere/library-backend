import { parentPort } from "worker_threads";
import { executeQuery } from "./executeQuery";

parentPort?.on("message", async (message) => {
  try {
    const query = message.queryType;
    const { book_id, mimetype, imgData } = message;
    const result = await executeQuery(query, [mimetype, imgData, book_id]);

    parentPort?.postMessage({ success: true, result });
  } catch (error: any) {
    parentPort?.postMessage({ success: false, error: error.message });
  }
});
