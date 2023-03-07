import { Request, Response } from "express";
import { pool } from "../../dbConnection";
// import { authorityList } from "../../config/authorityList";
// import { verifyAuthority } from "../../middleware/verifyAuthority.js";
// import jwt from "jsonwebtoken";
import checkDataDB from "../../functions/checkDataDB";

export default async function getSeller(req: Request, res: Response) {
    if (req.params) {
        try {
          const seller_name = ''+req.params.seller_name;
          const realSeller = await checkDataDB(seller_name, "sellers");
          if (realSeller === false) {
            return res.status(404).json({ Error: "Cannot find a seller" });
          }
          const sql = `SELECT 
          s.seller_name, 
          s.seller_photo, 
          s.seller_cover_image, 
          COUNT(p.product_id) AS product_count,
          s.seller_announcement,
          ARRAY_AGG(
            json_build_object(
              'seller_id', sc.seller_id,
              'seller_contact_facebook', sc.seller_contact_facebook,
              'seller_contact_instagram', sc.seller_contact_instagram,
              'seller_contact_tiktok', sc.seller_contact_tiktok,
              'seller_contact_apple_music', sc.seller_contact_apple_music,
              'seller_contact_spotify', sc.seller_contact_spotify
            )
          ) as seller_contacts
        FROM sellers s
        JOIN products p ON p.product_seller_id = s.seller_id
        JOIN seller_contact sc ON sc.seller_id = s.seller_id
        WHERE s.seller_name = $1
        GROUP BY s.seller_name, s.seller_photo, s.seller_cover_image, s.seller_announcement;
        `;

          const product = await pool.query(sql, [seller_name]);
      
        return res.json(product.rows);
    
    
          
        } catch (error) {
          return res.json({ Error: error.message });
        }
      }
      //  or have a look on all orders
      if (Object.keys(req.body).length === 0) {
        const sql = `SELECT  s.seller_name, 
        s.seller_photo, 
        s.seller_cover_image, 
        COUNT(p.product_id) AS product_count
        FROM Sellers s
        JOIN seller_products sp ON sp.seller_id = s.seller_id
        JOIN products p ON s.seller_id = p.product_seller_id
        GROUP BY s.seller_id, s.seller_name;`;
        const orders = await pool.query(sql);
        res.json(orders.rows);
      } else {
        return res.status(400).json({ Error: "Bad request" })
      }

}


