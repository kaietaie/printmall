import { Request } from "express";

export interface MyRequest extends Request {
    authority: number;
    name: string
}