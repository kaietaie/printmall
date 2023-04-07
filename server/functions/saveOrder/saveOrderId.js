import { pool } from "../../dbConnection.js";

export default async function saveOrderId(shippingId, status) {
  try {
    let finalized = false;
    if (status === "COMPLETED") finalized = true;
    
    const sql_order = `insert into orders( shipping_info_id, finalized )
    values ($1, $2)
    RETURNING order_id;`;
    const makeOrder = await pool.query(sql_order, [
      shippingId,
      finalized,
    ]);
    return makeOrder.rows[0].order_id
  } catch (error) {
    const errorMsg = `Save order id is failed: ${error.message}`;
    logger.error(errorMsg);
  } 
}