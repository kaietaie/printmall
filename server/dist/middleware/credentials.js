"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const allowedOrigins_1 = require("../CORS/allowedOrigins");
const credentials = (req, res, next) => {
    const origin = req.headers.origin;
    if (allowedOrigins_1.allowedOrigins.includes(origin)) {
        //тут було true типу Boolean, ts каже що треба передати строку. 
        // можуть бути проблеми в цьому місці
        res.header('Access-Control-Allow-Credentials', "true");
    }
    next();
};
exports.default = credentials;
//# sourceMappingURL=credentials.js.map