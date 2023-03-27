import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";
//
export default async function getPriceOrName(sku, value) {
  try {
    const product_id = sku.split("-")[1];

    const sql = `SELECT ${value} from products WHERE product_id=$1;`;
    const find = await pool.query(sql, [product_id]);

    const sql1 = `SELECT product_id from products WHERE sku=$1;`;
    const id = await pool.query(sql1, [sku]);

    find.rows[0].id = id.rows[0].product_id;
    return find.rows[0];
  } catch (error) {
    const errorMsg = `getPriceOrName is failed: ${error.message}`;
    logger.error(errorMsg);
    return false;
  }
}
