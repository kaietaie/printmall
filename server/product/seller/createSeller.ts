import { Request, Response } from "express";
import { pool } from "../../dbConnection";
import bcrypt from "bcrypt";


export default async function createSeller(req: Request, res: Response) {
    try {
        const {  seller_name,
            seller_password,
            seller_email,
            seller_photo,
            seller_cover_image } = req.body;
        const datetime = Date.now();
        const password = await bcrypt.hash(seller_password, 5);
        const query = `insert into sellers(
            seller_name,
            seller_password,
            seller_email,
            seller_photo,
            seller_cover_image,
            create_datetime,
            update_datetime 
        )
           values ($1, $2, $3, $4, $5, to_timestamp($6 / 1000.0), to_timestamp($7 / 1000.0));`;

        const params = [
            seller_name,
            password,
            seller_email,
            seller_photo,
            seller_cover_image,
            datetime,
            datetime];
        console.log({ params })
        pool.query(query, params, (err, result) => {
            if (err) {
              console.log(err.message);
              return res
                .status(400)
                .json({ Error: "Cannot create seller", message: err.message });
            } else {
                return res.status(201).send({Message: `New seller was added`, Success: result});
            }
          });
        // return res.sendStatus(201);
    } catch (error) {
        res.status(400).json({ message: "Registration error", ERROR: error.message });
    }


}