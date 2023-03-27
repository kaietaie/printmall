import winston from "winston";

const logger = winston.createLogger({
  level: "error",
  format: winston.format.json(),
  transports: [
    // new winston.transports.Console({ level: 'error' }),
    new winston.transports.File({
      // level: 'error',
      filename: "logs/errors.log",
      // datePattern: "YYYY-MM-DD",
      // zippedArchive: false,
      // maxSize: "20m",
      // maxFiles: "14d",
    }),
  ],
});

export default logger;
