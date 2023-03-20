import { allowedOrigins } from "../CORS/allowedOrigins.js";

const credentials = (req, res, next) => {
    const origin = req.headers.origin;
    if (allowedOrigins.includes(origin)) {
        //тут було true типу Boolean, ts каже що треба передати строку. 
        // можуть бути проблеми в цьому місці
        res.header('Access-Control-Allow-Credentials', "true");
    }
    next();
}

export default credentials;