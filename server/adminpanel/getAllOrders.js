import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";

export default async function getAllOrders(req, res) {
  // try {
  //   // Отримувати оплачені замовлення по 10 шт на сторінку
  //   const page = req.query.page || 1;
  //   const limit = req.query.limit || 10;
  //   const offset = (page - 1) * limit;
  //   const archive  = req.query.archive;

  //   const sql = `SELECT *,
  //     (SELECT COUNT(*) FROM orders WHERE payment_id IS NOT NULL) / $1 as total_pages
  // FROM orders 
  // WHERE payment_id IS NOT NULL 
  // AND delivered = $3
  // ORDER BY order_id DESC 
  // LIMIT $1 OFFSET $2;
  // `;
  //   const pagination = [limit, offset, archive];
  //   const response = await pool.query(sql, pagination);
  //   const order = response.rows;
  //   return res.json(order);

    try {
      const page = req.query.page || 1;
      const limit = req.query.limit || 10;
      const offset = (page - 1) * limit;
      const archive  = req.query.archive;
  
      const sql = `
        SELECT *,
          (SELECT COUNT(*) FROM orders WHERE payment_id IS NOT NULL AND delivered = $1) / $2 as total_pages
        FROM orders 
        WHERE payment_id IS NOT NULL 
          AND delivered = $1
        ORDER BY order_id DESC 
        LIMIT $2 OFFSET $3;
        `;
        
        
        // SELECT ceil(COUNT(*) / $2) as total_pages
        // FROM orders
        // WHERE payment_id IS NOT NULL AND delivered = $1;
      const pagination = [archive, limit, offset];
      const response = await pool.query(sql, pagination);
      // console.dir(response.rows)
      const orders = response.rows;
      const total_pages = response.rows[0].total_pages;
      
      return res.json({ orders, total_pages, page });
  } catch (error) {
    const errorMsg = `Get orders is failed: ${error.message}`;
    logger.error(errorMsg);
    return res.json({ Error: error.message });
  }
}
