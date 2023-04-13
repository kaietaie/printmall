import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";

export default async function getAllOrders(req, res) {
  try {
    if (req.params?.orderId) {
      const sql = `select * from orders WHERE order_id = $1`;
      const response = await pool.query(sql, [req.body.orderId]);

      const order = response.rows;
      return res.json(order);
    } else {
      // Отримувати оплачені замовлення по 10 шт на сторінку
      const page = req.params.page || 1;
      const limit = req.params.limit || 10;
      const offset = (page - 1) * limit;
      const sql = `SELECT *,
      (SELECT COUNT(*) FROM orders WHERE payment_id IS NOT NULL) / $1 as total_pages
  FROM orders 
  WHERE payment_id IS NOT NULL 
  AND delivered = false
  ORDER BY order_id DESC 
  LIMIT $1 OFFSET $2;
  `;
      const pagination = [limit, offset];
      const response = await pool.query(sql, pagination);

      const order = response.rows;
      return res.json(order);
    }
  } catch (error) {
    const errorMsg = `Get orders is failed: ${error.message}`;
    logger.error(errorMsg);
    return res.json({ Error: error.message });
  }
}
