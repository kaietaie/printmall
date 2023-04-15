import { pool } from "../../dbConnection.js";

export default async function savePayment(paymentInfo, order_id) {
  const sql = `insert into payments( paymentgateway_order_id, payment_processer_responce ) 
    values ($1, $2)
    RETURNING payment_id;`;
  if (paymentInfo.id) {
    const { id, data } = paymentInfo;
    const paymentId = await pool.query(sql, [id, data]);
    const pay_id = paymentId.rows[0].payment_id;
    if ( order_id) {
      pool.query('UPDATE orders SET payment_id=$1, finalized=true where order_id=$2', [pay_id, order_id])
    }

    return pay_id;
  } else {
    const paymentId = await pool.query(sql, ['', '']);
    return paymentId.rows[0].payment_id;
  }

}
