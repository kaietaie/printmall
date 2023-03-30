import winston from "winston";

const logger = winston.createLogger({
  level: "error",
  format: winston.format.json(),
  transports: [
    // new winston.transports.Console({ level: 'error' }),
    new winston.transports.File({
      filename: "logs/errors.log",
    }),
  ],
});

export default logger;
