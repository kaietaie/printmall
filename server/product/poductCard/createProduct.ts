import { Request, Response } from "express";
import { pool } from "../../dbConnection";

export default async function createProduct(req: Request, res: Response) {
    try {
        const { product_name,
            product_description,
            product_size,   //array
            product_color,  //array
            product_type,   //Clothes / Cups / Keyholders
            product_price,
            product_seller_id, } = req.body;

        const user_id = 1;
        const datetime = Date.now();
        const query0 = `insert into products ( 
            product_name,
            product_description,
            is_base_product,
            product_price,
            product_seller_id,
            create_user_id, 
            update_user_id, 
            create_datetime, 
            update_datetime)
            values($1, $2, $3, $4, $5, $6, $7, to_timestamp($8 / 1000.0), to_timestamp($9 / 1000.0))
            RETURNING product_id;`
        pool.query(query0, [ product_name,
            product_description, 
            true, 
            product_seller_id, 
            user_id,
            user_id,
            datetime,
            datetime ],
            (err, result) => {
                if (err) {
                    console.log(err.message);
                    return res
                        .status(400)
                        .json({ Error: "Cannot create an product", message: err.message });
                } else {
                    const product_id = result.rows[0].product_id
                    product_size.forEach(size => {
                        product_color.forEach(color => {
                            const sku = product_seller_id + "-" + product_id + "-" + size + "-" + color;

                            const query = `insert into products (
                            product_name,
                            product_size,
                            product_color,
                            product_type,
                            product_seller_id,
                            create_user_id, 
                            update_user_id, 
                            create_datetime, 
                            update_datetime,
                            base_id,
                            is_base_product,
                            sku ) 
                            values ($1, $2, $3, $4, $5, $6, $7, 
                                to_timestamp($8 / 1000.0), to_timestamp($9 / 1000.0),
                                $10, $11, $12)
                            RETURNING product_id;`;

                            const params = [
                                product_name,
                                size,
                                color,
                                product_type,
                                product_price,
                                product_seller_id,
                                user_id,
                                user_id,
                                datetime,
                                datetime,
                                product_id,
                                false,
                                sku
                            ];
                            pool.query(query, params)
                        })
                    })    
                };
            })
            return res.sendStatus(201)    
    }

    //     const query = `insert into products (
    //             product_name,
    //             product_description,
    //             product_size,
    //             product_color,
    //             product_type,
    //             product_price,
    //             product_seller_id,
    //             create_user_id, 
    //             update_user_id, 
    //             create_datetime, 
    //             update_datetime,
    //             base_id,
    //             is_base_product ) 
    //             values ($1, $2, $3, $4, $5, $6, $7, $8, $9, 
    //                 to_timestamp($10 / 1000.0), to_timestamp($11 / 1000.0)
    //                 $12, false)
    //             RETURNING product_id;`;

    //     const params = [
    //         product_name,
    //         product_description,
    //         product_size,
    //         product_color,
    //         product_type,
    //         product_price,
    //         product_seller_id,
    //         user_id,
    //         user_id,
    //         datetime,
    //         datetime,
    //         product_id
    //     ];
    //     pool.query(query, params, (err, result) => {
    //         if (err) {
    //             console.log(err.message);
    //             return res
    //                 .status(400)
    //                 .json({ Error: "Cannot create an product", message: err.message });
    //         } else {
    //             console.log(result);
    //             const sku = product_seller_id + "-" + result.rows[0].product_id + "-" + product_size + "-" + product_color;
    //             const query1 = `
    //                 insert into products (sku)
    //                 values($1)
    //                 where base_id = $2
    //                 `
    //             pool.query(query1, [sku, product_id])
    //             return res.status(201).send({ message: `Product was added` });
    //         }
    //     });
    // }
    //             });


    // return res.sendStatus(201);
    catch (error) {
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