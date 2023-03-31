import winston from "winston";
const { combine, timestamp, prettyPrint } = winston.format

const logger = winston.createLogger({
  level: "error",
  format: combine(
    timestamp(),
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
