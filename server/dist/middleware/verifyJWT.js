"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
require("dotenv/config");
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
function verifyJWT(req, res, next) {
    const authHeader = req.headers.authorization || req.headers.Authorization;
    if (!authHeader)
        return res.sendStatus(401);
    const token = authHeader;
    jsonwebtoken_1.default.verify(token, process.env.ACCESSKEY, (error, decoded) => {
        if (error)
            return res.status(403).json({ error: error.message });
        req.authority = decoded.authority;
        req.name = decoded.name;
        next();
    });
}
exports.default = verifyJWT;
//# sourceMappingURL=verifyJWT.js.map