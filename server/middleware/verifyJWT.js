import "dotenv/config";
import jwt from "jsonwebtoken";

export default function verifyJWT (req, res, next) {
    const token = req.headers.authorization || req.headers.Authorization.toString();
    if (!token) return res.sendStatus(401);
    jwt.verify(
        token,
        process.env.ACCESSKEY,
        (error, decoded) => {
            if (error) return res.status(403).json({error: error.message});
            req.authority = decoded.authority;
            req.name = decoded.name;
            next()
        }
    )
}