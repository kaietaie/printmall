import { Request, Response } from "express";
// import { authorityList } from "../../config/authorityList";
import { pool } from "../../dbConnection";
// import { verifyAuthority } from "../../middleware/verifyAuthority.js";
// import jwt from "jsonwebtoken";
import checkDataDB from "../../functions/checkDataDB";
import { ProductsArray } from "../../interfaces/interfaces";

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

  if (req.params.id) {
    try {
      const product_id = ''+req.params.id;
      const realProduct = await checkDataDB(Number(product_id), "products");
      if (realProduct === false) {
        return res.status(404).json({ Error: "Cannot find a product" });
      }
      // const sql = `SELECT  p.product_id, 
      //       p.product_name, 
      //       p.product_price, 
      //       COALESCE(ROUND(avg_reviews.review_rating, 2), 0) as review_rating, 
      //       s.seller_name,
      //       s.seller_rating
      //       FROM products p 
      //       LEFT JOIN (
      //        SELECT product_id, AVG(review_rating) as review_rating 
      //        FROM reviews 
      //        GROUP BY product_id
      //       ) as avg_reviews ON avg_reviews.product_id = p.product_id 
      //       JOIN sellers s ON s.seller_id = p.product_seller_id 
      //       WHERE p.product_id = $1
      //       ORDER BY p.product_id;`;
      // const product = await pool.query(sql, [product_id]);
      // 
      // const sqlColors = `SELECT c.color, pi.product_image
      // FROM products_colors pc
      // JOIN colors c ON c.color_id = pc.color_id
      // JOIN products_images pi on pi.color_id = pc.color_id
      // WHERE pc.product_id = $1 AND pi.product_id = $1;
      // `;
      // const productColors = await pool.query(sqlColors, [product_id]);




      // product.rows[0].colors = productColors.rows
      // return res.json(product.rows);

      const sql = `
  SELECT p.product_id, 
         p.product_name, 
         p.product_price,
         p.product_discription, 
         c.color,
         pi.product_image
  FROM products p 
  JOIN products_colors pc ON pc.product_id = p.product_id
  JOIN colors c ON c.color_id = pc.color_id
  JOIN products_images pi ON pi.color_id = pc.color_id AND pi.product_id = p.product_id
  WHERE p.product_id = $1
  ORDER BY p.product_id, c.color;
`;

      const product = await pool.query(sql, [product_id]);

      // Construct the response object
      const response = {
        product_id: product.rows[0].product_id,
        product_name: product.rows[0].product_name,
        product_discription: product.rows[0].product_discription,
        product_price: product.rows[0].product_price,
        seller_name: product.rows[0].seller_name,
        colors: [],
      };

      // Add color and product image data to the response object
      for (const row of product.rows) {
        const color = row.color;
        const productImage = row.product_image;
        response.colors.push({ color, product_image: productImage });
      }





      return res.json(response);
    } catch (error) {
      return res.json({ Error: error.message });
    }
  }
  //  or have a look on all orders
  if (Object.keys(!req.body.product_id)) {
    //     const sql = `SELECT p.product_id, 
    //     p.product_name, 
    //     p.product_price, 
    //     s.seller_name,
    //     c.color,
    //     pi.product_image
    // FROM products p 
    // JOIN sellers s ON s.seller_id = p.product_seller_id 
    // JOIN products_colors pc ON pc.product_id = p.product_id
    // JOIN colors c ON c.color_id = pc.color_id
    // JOIN products_images pi ON pi.color_id = pc.color_id AND pi.product_id = p.product_id
    // ORDER BY p.product_id, c.color;`;
    //     const orders = await pool.query(sql);



    //     const mergedObj = result.reduce((accumulator, current) => {
    //       // Перевіряємо, чи існує вже об'єкт з поточним product_id в accumulator
    //       const existingProduct = accumulator.find(product => product.product_id === current.product_id);

    //       if (existingProduct) {
    //         // Якщо об'єкт існує, додаємо до нього нову колірну варіацію
    //         existingProduct.colors.push({
    //           color: current.color,
    //           product_image: current.product_image
    //         });
    //       } else {
    //         // Якщо об'єкта ще не існує, створюємо новий з першою колірною варіацією
    //         accumulator.push({
    //           product_id: current.product_id,
    //           product_name: current.product_name,
    //           product_price: current.product_price,
    //           seller_name: current.seller_name,
    //           colors: [{
    //             color: current.color,
    //             product_image: current.product_image
    //           }]
    //         });
    //       }

    //       return accumulator;
    //     }, []);

 
    //     res.json(mergedObj);

    const limit = req.query.limit ? parseInt(req.query.limit  as string) : 9
    const page = req.query.page ? parseInt(req.query.page as string) : 1
    const offset = (page - 1) * limit
    const sql = `SELECT p.product_id, 
                  p.product_name, 
                  p.product_price, 
                  string_agg(c.color, ',') as colors,
                  string_agg(pi.product_image, ',') as product_images
                  FROM products p 
                  JOIN products_colors pc ON pc.product_id = p.product_id
                  JOIN colors c ON c.color_id = pc.color_id
                  JOIN products_images pi ON pi.color_id = pc.color_id AND pi.product_id = p.product_id
                  GROUP BY p.product_id, p.product_name, p.product_price
                  ORDER BY p.product_id
                  limit $1 offset $2;`
    var result: ProductsArray[] = []
    const products = await pool.query(sql, [limit, offset]);
    for (let i = 0; i < products.rows.length; i++) {
      let tempColors = products.rows[i].colors.split(',');
      let tempImages = products.rows[i].product_images.split(',')
      for (let j = 0; j < tempColors.length; j++) {
     
      result.push({
        product_id: products.rows[i].product_id,
        product_name: products.rows[i].product_name,
        product_price: products.rows[i].product_price,
        seller_name: products.rows[i].seller_name,
        colors: [{
          color: tempColors[j],
          product_image: tempImages[j]
                }]
              
      }) 
    }}

    const mergedObj = result.reduce((accumulator, current) => {
            // Перевіряємо, чи існує вже об'єкт з поточним product_id в accumulator
            const existingProduct = accumulator.find(product => product.product_id === current.product_id);
  
            if (existingProduct) {
              // Якщо об'єкт існує, додаємо до нього нову колірну варіацію
              existingProduct.colors.push(current.colors[0],
                // product_image: current.product_image
              );
            } else {
              // Якщо об'єкта ще не існує, створюємо новий з першою колірною варіацією
              accumulator.push({
                product_id: current.product_id,
                product_name: current.product_name,
                product_price: current.product_price,
                seller_name: current.seller_name,
                colors: [
                  current.colors[0],
                  // product_image: current.product_image
                ]
              });
            }
  
            return accumulator;
          }, []);
  
  
          res.json(mergedObj);
    // res.json(result);
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
// const sql = `SELECT p.product_id, 
// p.product_name, 
// p.product_price, 
// s.seller_name,
// string_agg(c.color, ',') as colors,
// string_agg(pi.product_image, ',') as product_images
// FROM products p 
// JOIN sellers s ON s.seller_id = p.product_seller_id 
// JOIN products_colors pc ON pc.product_id = p.product_id
// JOIN colors c ON c.color_id = pc.color_id
// JOIN products_images pi ON pi.color_id = pc.color_id AND pi.product_id = p.product_id
// GROUP BY p.product_id, p.product_name, p.product_price, s.seller_name
// ORDER BY p.product_id
// limit $1 offset $2;`

// const sql = `
// SELECT p.product_id, 
//        p.product_name, 
//        p.product_price,
//        p.product_discription, 
//        s.seller_name,
//        c.color,
//        pi.product_image
// FROM products p 
// JOIN sellers s ON s.seller_id = p.product_seller_id 
// JOIN products_colors pc ON pc.product_id = p.product_id
// JOIN colors c ON c.color_id = pc.color_id
// JOIN products_images pi ON pi.color_id = pc.color_id AND pi.product_id = p.product_id
// WHERE p.product_id = $1
// ORDER BY p.product_id, c.color;
// `;