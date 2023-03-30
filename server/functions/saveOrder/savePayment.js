import { pool } from "../../dbConnection.js";

export default async function savePayment(paymentInfo) {
  const sql = `insert into payments( paymentgateway_order_id, payment_processer_responce ) 
    values ($1, $2)
    RETURNING payment_id;`;
    console.log(paymentInfo)
  if (paymentInfo.id) {
    const { id, data } = paymentInfo;

    const paymentId = await pool.query(sql, [id, data]);
    return paymentId.rows[0].payment_id;
  } else {
    const paymentId = await pool.query(sql, ['', '']);
    return paymentId.rows[0].payment_id;
  }

}
