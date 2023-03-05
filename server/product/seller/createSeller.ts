import { Request, Response } from "express";
import { pool } from "../../dbConnection";
import bcrypt from "bcrypt";


export default async function createSeller(req: Request, res: Response) {
    try {
        const {  seller_name,
            seller_password,
            seller_email,
            seller_photo,
            seller_cover_image,
            seller_announcement
         } = req.body;
        const datetime = Date.now();
        const password = await bcrypt.hash(seller_password, 5);
        const query = `insert into sellers(
            seller_name,
            seller_password,
            seller_email,
            seller_photo,
            seller_cover_image,
            seller_announcement
            create_datetime,
            update_datetime 
        )
           values ($1, $2, $3, $4, $5, %6 to_timestamp($7 / 1000.0), to_timestamp($8 / 1000.0));`;

        const params = [
            seller_name,
            password,
            seller_email.trim().toLowerCase(),
            seller_photo,
            seller_cover_image,
            seller_announcement,
            datetime,
            datetime];
        pool.query(query, params, (err) => {
            if (err) {
              console.log(err.message);
              return res
                .status(400)
                .json({ Error: "Cannot create seller", message: err.message });
            } else {
                return res.status(201).send({Message: `New seller was added`});
            }
          });
    } catch (error) {
        res.status(400).json({ message: "Registration error", ERROR: error.message });
    }


}