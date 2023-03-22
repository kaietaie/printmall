import { pool } from "../../dbConnection.js";

export default async function savePayment(captureData) {

    const sql = `insert into payments( paymentgateway_order_id, payment_processer_responce ) 
    values ($1, $2)
    RETURNING payment_id;`;
    
    const paymentId = await pool.query(sql, [captureData.id, captureData]);
    return paymentId.rows[0].payment_id
}