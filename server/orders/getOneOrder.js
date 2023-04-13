import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";

export default async function getOneOrder(req, res) {
  try {
    const { orderId } = req.params;
    const sql = `select o.*, json_build_object(
      'shipping_info_id', s.shipping_info_id,
      'first_name', s.first_name,
      'last_name', s.last_name,
      'phone', s.phone,
      'email', s.email,
      'address_line_1', s.address_line_1,
      'address_line_2', s.address_line_2,
      'city', s.city,
      'region', s.region,
      'country', s.country,
      'zip', s.zip
    ) AS shipping ,
    json_build_object( 
      'payment_response_id', pa.paymentgateway_order_id,
      'payment_description', pa.payment_processer_responce) as payment
    from orders as o
    JOIN shipping_info s ON o.shipping_info_id = s.shipping_info_id
    JOIN payments pa on pa.payment_id = o.payment_id
    WHERE order_id = $1;`;
    const response = await pool.query(sql, [orderId]);
    const sql_line = `select * from order_lines WHERE order_id = $1`;
    const response_line = await pool.query(sql_line, [orderId]);
    const sql_all =`select o.*, json_build_object(
      'shipping_info_id', s.shipping_info_id,
      'first_name', s.first_name,
      'last_name', s.last_name,
      'phone', s.phone,
      'email', s.email,
      'address_line_1', s.address_line_1,
      'address_line_2', s.address_line_2,
      'city', s.city,
      'region', s.region,
      'country', s.country,
      'zip', s.zip
    ) AS shipping 
    from orders as o
    JOIN shipping_info s ON o.shipping_info_id = s.shipping_info_id
    WHERE order_id = $1;
      
    `
    const response_all = await pool.query(sql_all, [orderId]);

    const order = { order: response.rows[0], orderLines: response_line.rows, allinfo: response_all.rows};
    return res.json(order);
  } catch (error) {
    const errorMsg = `Get order is failed: ${error.message}`;
    logger.error(errorMsg);
    return res.json({ Error: error.message });
  }
}
