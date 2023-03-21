import { pool } from "../../dbConnection.js";
import checkDataDB from "../../functions/checkDataDB.js";

export default async function getProduct(req, res) {
  if (req.params.id) {
    try {
      const product_id = "" + req.params.id;
      const realProduct = await checkDataDB(Number(product_id), "products");
      if (realProduct === false) {
        return res.status(404).json({ Error: "Cannot find a product" });
      }

      const sql = `
      SELECT p.product_id, 
    p.product_name, 
    p.product_description,
    (SELECT json_agg(json_build_object('color', colors.color, 'product_image', pi.products_images))
     FROM (SELECT DISTINCT v.product_color FROM products v WHERE v.base_id = p.product_id AND v.is_base_product = false) AS v
     JOIN colors ON colors.color_id = v.product_color
     JOIN products_images pi ON pi.product_id = p.product_id AND pi.color_id = v.product_color
    ) AS colors,
    (SELECT json_object_agg(size, colors) as size_colors
    FROM (
      SELECT c.color, array_agg(ss.size) as sizes
      FROM products p
      JOIN sizes ss ON ss.size_id = p.product_size
      JOIN colors c ON c.color_id = p.product_color  
      WHERE p.base_id = $1 
      GROUP BY c.color
    ) as colors) as color_sizes,
    ( select array_agg( DISTINCT ss.size )
      from products p 
      join sizes ss on ss.size_id = p.product_size 
      where p.is_base_product = false and p.base_id = $1)   as sizes,
    s.seller_name,
    p.product_seller_id as seller_id,
    p.product_price,
    (SELECT json_object_agg(size, size_id) 
    as sizes FROM sizes) as sku_size,
    (SELECT json_object_agg(color, color_id) 
    as colors FROM colors) as sku_color
FROM products p 
JOIN sellers s ON s.seller_id = p.product_seller_id
WHERE p.product_id = $1 AND p.is_base_product = true
GROUP BY p.product_id, p.product_name, s.seller_name, p.product_price;
`;

      const product = await pool.query(sql, [product_id]);

      return res.json(product.rows[0]);
    } catch (error) {
      return res.json({ Error: error.message });
    }
  }
  //  or have a look on all orders
  if (Object.keys(!req.body.product_id)) {
    const limit = req.query.limit ? parseInt(req.query.limit) : 9;
    const page = req.query.page ? parseInt(req.query.page) : 1;
    const offset = (page - 1) * limit;
    // const products = [
    //   {
    //     id: 1,
    //     name: 'Bold Statement Graphic Tee',
    //     colors: [
    //       { name: 'white', image: tw },
    //       { name: 'black', image: tb },
    //       { name: 'green', image: tg },
    //     ],
    //     seller: 'Solider',
    //     rating: 4.8,
    //     sales: 2310,
    //     price: 29.99,
    //   }]
    const sql = `SELECT p.product_id, 
    p.product_name, 
    (SELECT json_agg(json_build_object('color', colors.color, 'product_image', pi.products_images))
     FROM (SELECT DISTINCT v.product_color FROM products v WHERE v.base_id = p.product_id AND v.is_base_product = false) AS v
     JOIN colors ON colors.color_id = v.product_color
     JOIN products_images pi ON pi.product_id = p.product_id AND pi.color_id = v.product_color
    ) AS colors,
    s.seller_name,
    p.product_price 
FROM products p 
JOIN sellers s ON s.seller_id = p.product_seller_id
WHERE p.is_base_product = true
GROUP BY p.product_id, p.product_name, s.seller_name, p.product_price
                  limit $1 offset $2;`;
    var result = [];
    const products = await pool.query(sql, [limit, offset]);

    res.json(products.rows);
  } else {
    return res.status(400).json({ Error: "Bad request" });
  }
}
