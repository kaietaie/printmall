import { Request, Response } from "express";
import { pool } from "../dbConnection";

export default async function getBlog(req: Request, res: Response) {
    const sql = `SELECT  *  FROM blog;`;
    const blog = await pool.query(sql);
    res.json(blog.rows);
}

//   Cars.brand, Cars.model, Cars.Engine
