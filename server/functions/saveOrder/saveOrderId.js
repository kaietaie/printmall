import { pool } from "../../dbConnection.js";

export default async function saveOrderId(shippingId, paymentId, captureData) {
    let finalized = false;
    if (captureData.status === "COMPLETED") finalized = true;

    const sql_order = `insert into orders( shipping_info_id, payment_id, finalized )
    values ($1, $2, $3)
    RETURNING order_id;`;
    const makeOrder = await pool.query(sql_order, [
      shippingId,
      paymentId,
      finalized,
    ]);
    return makeOrder.rows[0].order_id
}