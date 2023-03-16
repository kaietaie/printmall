import { pool } from "../dbConnection.js";

export default async function getBlog(req, res) {
    const sql = `SELECT  *  FROM blog;`;
    const blog = await pool.query(sql);
    res.json(blog.rows);
}

//   Cars.brand, Cars.model, Cars.Engine
