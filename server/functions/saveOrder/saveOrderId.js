import { pool } from "../../dbConnection.js";
import logger from "../../logger/logger.js";

export default async function saveOrderId(shippingId, paymentId, status) {
  try {
    let finalized = false, makeOrder;
    if (status !== "COMPLETED" && !paymentId) {
      const sql_order = `insert into orders( shipping_info_id, finalized )
    values ($1, $2)
    RETURNING order_id;`;
      makeOrder = await pool.query(sql_order, [shippingId, finalized]);
    } else if (status === "COMPLETED" && !paymentId) {
      finalized = true;
      const sql_order = `insert into orders( shipping_info_id, finalized )
    values ($1, $2)
    RETURNING order_id;`;
      makeOrder = await pool.query(sql_order, [shippingId, finalized]);
    } else if (status === "COMPLETED" && paymentId) {
      finalized = true;
      const sql_order = `insert into orders( shipping_info_id, finalized, payment_id )
      values ($1, $2, $3)
      RETURNING order_id;`;
      makeOrder = await pool.query(sql_order, [
        shippingId,
        finalized,
        paymentId,
      ]);
    }
    return makeOrder.rows[0].order_id;
  } catch (error) {
    const errorMsg = `Save order id is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
