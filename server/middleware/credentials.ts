import { Request, Response, NextFunction } from "express";
import { allowedOrigins } from "../CORS/allowedOrigins";

const credentials = (req: Request, res: Response, next: NextFunction) => {
    const origin = req.headers.origin;
    if (allowedOrigins.includes(origin)) {
        //тут було true типу Boolean, ts каже що треба передати строку. 
        // можуть бути проблеми в цьому місці
        res.header('Access-Control-Allow-Credentials', "true");
    }
    next();
}

export default credentials;