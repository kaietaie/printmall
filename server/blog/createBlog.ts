import { Request, Response } from "express";
import { pool } from "../dbConnection";

export default async function createBlog(req: Request, res: Response) {
    try {
        const { ua_title,
            ua_text,
            en_title,
            en_text, image } = req.body;
        const user_id = 1;
        const datetime = Date.now() //+ '::abstime';

        const query = `insert into blog (
            ua_blog_title, 
            ua_blog_text, 
            en_blog_title, 
            en_blog_text,
            blog_image, 
            create_user_id, 
            update_user_id, 
            create_datetime, 
            update_datetime ) 
            values ($1, $2, $3, $4, $5, $6, $7, to_timestamp($8 / 1000.0), to_timestamp($9 / 1000.0));`;

        const params = [
            ua_title,
            ua_text,
            en_title,
            en_text,
            image,
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
                .json({ Error: "Cannot create an order", message: err.message });
            } else {
                console.log("Finish");
                return res.status(201).send(`Order was added`);
            }
          });
        // return res.sendStatus(201);
    } catch (error) {
        res.status(400).json({ message: "Registration error", ERROR: error.message });
    }


}