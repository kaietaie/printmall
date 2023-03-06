import { Request, Response } from "express";
import { pool } from "../../dbConnection";

export default async function createProduct(req: Request, res: Response) {
    try {
        const { product_name,
            product_discription,
            product_size,
            product_price,
            product_seller_id,} = req.body;
        const user_id = 1;
        const datetime = Date.now();

        const query = `insert into products (
            product_name,
            product_discription,
            product_size,
            product_price,
            product_seller_id,
            create_user_id, 
            update_user_id, 
            create_datetime, 
            update_datetime ) 
            values ($1, $2, $3, $4, $5, $6, $7, to_timestamp($8 / 1000.0), to_timestamp($9 / 1000.0));`;

        const params = [
            product_name,
            product_discription,
            product_size,
            product_price,
            product_seller_id,
            user_id,
            user_id,
            datetime,
            datetime
        ];
        pool.query(query, params, (err, result) => {
            if (err) {
                console.log(err.message);
                return res
                    .status(400)
                    .json({ Error: "Cannot create an product", message: err.message });
            } else {
                console.log("Finish");
                return res.status(201).send({ message:`Product was added` });
            }
        });
        // return res.sendStatus(201);
    } catch (error) {
        res.status(400).json({ message: "Publication error", ERROR: error.message });
    }


}
// Also need to finish registration new product add info to this 2 tables

// insert into products_images( product_id, product_image, color_id) values
// ( 10, '/public/product_images/10/black.png', 2),
// ( 10, '/public/product_images/10/white.png', 1),
// ( 10, '/public/product_images/10/yellow.png', 4),
// ( 10, '/public/product_images/10/grey.png', 5);

// insert into products_colors (product_id, color_id)
// values 
// (10, 2),(10, 1),(10, 4),(10, 5);