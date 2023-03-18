import { pool } from "../dbConnection.js";

export default async function saveToDB(createData) {
  try {
    const sql = `insert into payments( paymentgateway_order_id, payment_processer_responce ) 
    values ($1, $2)
    RETURNING payment_id;`;
    
    const request = await pool.query(sql, [createData.id, createData]);
    // if (
    //   find?.rows[0]?.archivated === true ||
    //   find?.rows[0]?.enabled === false
    // ) {
    //   return false;
    // }4
    return request.rows[0].payment_id;
  } catch (error) {
    console.log(error);
    return false;
  }
}

