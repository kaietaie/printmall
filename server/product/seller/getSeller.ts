import { Request, Response } from "express";
import { pool } from "../../dbConnection";
// import { authorityList } from "../../config/authorityList";
// import { verifyAuthority } from "../../middleware/verifyAuthority.js";
// import jwt from "jsonwebtoken";
import checkDataDB from "../../functions/checkDataDB";

export default async function getSeller(req: Request, res: Response) {
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