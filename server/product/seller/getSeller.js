import { pool } from "../../dbConnection.js";
import checkDataDB from "../../functions/checkDataDB.js";
import logger from "../../logger/logger.js";

export default async function getSeller(req, res) {
  if (req.params) {
    try {
      const seller_name = '' + req.params.seller_name;
      const realSeller = await checkDataDB(seller_name, "sellers");
      if (realSeller === false) {
        return res.status(404).json({ Error: "Cannot find a seller" });
      }
      const sql = `SELECT 
          s.seller_name, 
          s.seller_photo, 
          s.seller_cover_image, 
          s.seller_announcement
        FROM sellers s
        WHERE s.seller_name = $1
        GROUP BY s.seller_name, s.seller_photo, s.seller_cover_image, s.seller_announcement;
        `;

      const product = await pool.query(sql, [seller_name]);

      return res.json(product.rows[0]);



    } catch (error) {
      const errorMsg = `Get product is failed: ${error.message}`;
      logger.error(errorMsg);
      return res.json({ Error: error.message });
    }
  }
}


// const sql = `SELECT 
// s.seller_name, 
// s.seller_photo, 
// s.seller_cover_image, 
// COUNT(p.product_id) AS product_count,
// s.seller_announcement
// FROM sellers s
// JOIN products p ON p.product_seller_id = s.seller_id
// WHERE s.seller_name = $1
// GROUP BY s.seller_name, s.seller_photo, s.seller_cover_image, s.seller_announcement;
// `;