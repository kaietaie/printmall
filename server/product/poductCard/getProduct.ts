import { Request, Response } from "express";
import { authorityList } from "../../config/authorityList";
import { pool } from "../../dbConnection";
import { verifyAuthority } from "../../middleware/verifyAuthority.js";
import jwt from "jsonwebtoken";
import checkDataDB from "../../functions/checkDataDB";

export default async function getProduct(req: Request, res: Response) {
  //   try {
  //     // if (verifyAuthority(req, authorityList.User, authorityList.Seller)) {
  //     //   const token = req.headers.authorization || req.headers.Authorization;
  //     //   const auth = jwt.decode(token, { complete: true });
  //     //   const user_id = auth.payload.user_id;
  //     //   try {
  //     //     const sql = `SELECT * FROM orders WHERE user_id = $1;`;
  //     //     const order = await pool.query(sql, [user_id]);
  //     //     return res.json(order.rows);
  //     //   } catch (error) {
  //     //     return res.json({ Error: error.message });getOrders(req, res)
  //     //   }
  //     } else {
  //   if (verifyAuthority(req, authorityList.Admin)) {
  // check orders for some user : {"user_id" : 2}
  if (req.body?.product_id) {
    try {
      const product_id = req.body.product_id;
      const realProduct = await checkDataDB(product_id, "products");
      if (realProduct === false) {
        return res.status(404).json({ Error: "Cannot find a pdoduct" });
      }
      const sql = `SELECT  p.product_id, 
            p.product_name, 
            p.product_price, 
            COALESCE(ROUND(avg_reviews.review_rating, 2), 0) as review_rating, 
            s.seller_name,
            s.seller_rating
            FROM products p 
            LEFT JOIN (
             SELECT product_id, AVG(review_rating) as review_rating 
             FROM reviews 
             GROUP BY product_id
            ) as avg_reviews ON avg_reviews.product_id = p.product_id 
            JOIN sellers s ON s.seller_id = p.product_seller_id 
            WHERE p.product_id = $1
            ORDER BY p.product_id;`;
      const product = await pool.query(sql, [product_id]);
      const sqlColors = `SELECT c.color, pi.product_image
      FROM products_colors pc
      JOIN colors c ON c.color_id = pc.color_id
      JOIN products_images pi on pi.color_id = pc.color_id
      WHERE pc.product_id = $1 AND pi.product_id = $1;
      `;
      const productColors = await pool.query(sqlColors, [product_id]);
      



      product.rows[0].colors = productColors.rows
      return res.json(product.rows[0]);
    } catch (error) {
      return res.json({ Error: error.message });
    }
  }
  //  or have a look on all orders
  if (Object.keys(req.body).length === 0) {
    const sql = `SELECT  p.product_id, 
        p.product_name, 
        c.color, 
        p.product_price, 
        COALESCE(ROUND(avg_reviews.review_rating, 2), 0) as review_rating, 
        s.seller_name,
        s.seller_rating
FROM products p 
JOIN products_colors pc ON pc.product_id = p.product_id 
LEFT JOIN colors c ON c.color_id = pc.color_id 
LEFT JOIN (
  SELECT product_id, AVG(review_rating) as review_rating 
  FROM reviews 
  GROUP BY product_id
) as avg_reviews ON avg_reviews.product_id = p.product_id 
JOIN sellers s ON s.seller_id = p.product_seller_id 
ORDER BY p.product_id;`;
    const orders = await pool.query(sql);
    res.json(orders.rows);
  } else {
    return res.status(400).json({ Error: "Bad request" })
  }
}
    // }
//   } catch (error) {
//     return res
//       .status(401)
//       .json({ Error: "Unauthorized", message: error.message });
//   }
// }
