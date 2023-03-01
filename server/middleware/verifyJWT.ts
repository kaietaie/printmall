import { Request, Response, NextFunction } from "express";
import "dotenv/config";
import jwt from "jsonwebtoken";

export default function verifyJWT (req: Request, res: Response, next: NextFunction) {
    const authHeader = req.headers.authorization || req.headers.Authorization;
    if (!authHeader) return res.sendStatus(401);
    const token = authHeader;
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