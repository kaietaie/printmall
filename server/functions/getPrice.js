import { pool } from "../dbConnection.js";
// 
export default async function getPriceOrName(sku, value) {
  try {
    const product_id = sku.split('-')[1];
    const sql = `SELECT ${value} from products WHERE product_id=$1;`;
    
    const find = await pool.query(sql, [product_id]);
    // if (
    //   find?.rows[0]?.archivated === true ||
    //   find?.rows[0]?.enabled === false
    // ) {
    //   return false;
    // }4
    return find.rows[0];
  } catch (error) {
    console.log(error);
    return false;
  }
}

