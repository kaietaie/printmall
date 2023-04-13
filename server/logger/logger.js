import winston from "winston";
const { combine, timestamp, prettyPrint } = winston.format

const logger = winston.createLogger({
  level: "error",
  format: combine(
    timestamp({
      format: 'YYYY-MM-DD HH:mm:ss'
    }),
    winston.format.errors({ stack: true }),
    prettyPrint()
  ),
  transports: [
    // new winston.transports.Console({ level: 'error' }),
    new winston.transports.File({
      filename: "logs/errors.log",
    }),
  ],
});

export default logger;
