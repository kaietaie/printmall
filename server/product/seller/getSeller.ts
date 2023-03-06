import { Request, Response } from "express";
import { authorityList } from "../../config/authorityList";
import { pool } from "../../dbConnection";
import { verifyAuthority } from "../../middleware/verifyAuthority.js";
import jwt from "jsonwebtoken";
import checkDataDB from "../../functions/checkDataDB";

export default async function getSeller(req: Request, res: Response) {
    if (req.body?.seller_name) {
        try {
          const seller_name = req.body.seller_name;
          const realSeller = await checkDataDB(seller_name, "sellers");
          if (realSeller === false) {
            return res.status(404).json({ Error: "Cannot find a seller" });
          }
          const sql = `SELECT 
                        s.seller_name, 
                        s.seller_photo, 
                        s.seller_cover_image, 
                        COUNT(p.product_id) AS product_count,
                        s.seller_announcement
                    FROM sellers s
                    JOIN products p ON p.product_seller_id = s.seller_id    
                    WHERE s.seller_name = $1
                    GROUP BY s.seller_name, s.seller_photo, 
                    s.seller_cover_image, s.seller_announcement;`;

          const product = await pool.query(sql, [seller_name]);
          
        //   const sqlColors = `SELECT c.color, pi.product_image
        //   FROM products_colors pc
        //   JOIN colors c ON c.color_id = pc.color_id
        //   JOIN products_images pi on pi.color_id = pc.color_id
        //   WHERE pc.product_id = $1 AND pi.product_id = $1;
        //   `;
        //   const productColors = await pool.query(sqlColors, [product_id]);
          
    
    
    
          
          return res.json(product.rows[0]);
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


