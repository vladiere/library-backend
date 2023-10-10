import pino, { Logger, LoggerOptions } from "pino";
import pinoPretty from "pino-pretty";

// Create the Pino logger with custom prettifier
const logger: Logger = pino(
  {
    customLevels: {
      // Define your custom log levels here if needed
    },
  },
  pinoPretty({
    translateTime: "SYS:dd-mm-yy HH:MM:ss",
    ignore: "pid,hostname",
    customPrettifiers: {
      fileInfo: (log) => {
        // Extract file name and line number from the call stack
        const callerInfo = new Error().stack
          ?.split("\n")[3]
          ?.match(/\(([^)]+)\)$/);
        const fileInfo = callerInfo ? callerInfo[1].split(":") : [];
        const fileName = fileInfo[0] || "unknown";
        const lineNumber = fileInfo[1] || "unknown";

        return `(${fileName}:${lineNumber})`;
      },
    },
  }),
);

export default logger;
