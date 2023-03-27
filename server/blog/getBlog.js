import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";

export default async function getBlog(req, res) {
   try {
    
       const sql = `SELECT  *  FROM blog;`;
       const blog = await pool.query(sql);
       res.json(blog.rows);
    } catch (error) {
        logger.error('Something went wrong! '+ error.message );
        return res.status(500).json(error.message)
    }
}


