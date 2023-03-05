import { Response, NextFunction } from "express";
import { MyRequest } from "../interfaces/interfaces";
import "dotenv/config";
import jwt from "jsonwebtoken";

export default function verifyJWT (req: MyRequest, res: Response, next: NextFunction) {
    const token: string = req.headers.authorization || req.headers.Authorization.toString();
    if (!token) return res.sendStatus(401);
    jwt.verify(
        token,
        process.env.ACCESSKEY,
        (error, decoded: jwt.JwtPayload) => {
            if (error) return res.status(403).json({error: error.message});
            req.authority = decoded.authority;
            req.name = decoded.name;
            next()
        }
    )
}