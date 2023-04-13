import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";

export default async function editOrder(req, res) {
  try {
    const { numPage } = req.body;
    // Отримувати оплачені замовлення по 10 шт на сторінку
    let page = numPage || 1,
      limit = 10;
    const offset = (page - 1) * limit;
    const sql = `select * from orders WHERE payment_id IS NOT NULL limit $1 offset $2;`;
    const pagination = [limit, offset];
    const response = await pool.query(sql, pagination);

    const order = response.rows;
    return res.json(order);
  } catch (error) {
    const errorMsg = `Get orders is failed: ${error.message}`;
    logger.error(errorMsg);
    return res.json({ Error: error.message });
  }
}
