import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";

export default async function editOrder(req, res) {
  try {
    const { orderId, column, value } = req.body;
    const sql = `UPDATE orders SET ${column} = ${value} WHERE order_id = ${orderId};`;
    await pool.query(sql);
    return res.sendStatus(200);
  } catch (error) {
    const errorMsg = `Get orders is failed: ${error.message}`;
    logger.error(errorMsg);
    return res.json({ Error: error.message });
  }
}
