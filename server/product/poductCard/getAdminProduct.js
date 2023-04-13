import { pool } from "../../dbConnection.js";
import logger from "../../logger/logger.js";

export default async function getAdminProduct(req, res) {
    try {
        const product_id = req.params.id;
        const sql = `
        SELECT p.base_id, p.product_name, size, color
        from products p
        join colors c on c.color_id = p.product_color
        join sizes s on s.size_id = p.product_size
        
        where product_id = $1;
        `
        const product = await pool.query(sql, [product_id]);
        return res.json(product.rows)
} catch (error) {
    const errorMsg = `Get product fot Admin is failed: ${error.message}`;
    logger.error(errorMsg);
    return res.json({ Error: error.message });
  }
}
