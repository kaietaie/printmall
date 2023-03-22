import { pool } from "../dbConnection.js";

export default async function contactUs(req, res) {
  const { fname, lname, email, phone, message } = req.body;

  const sql = `INSERT INTO contact_us (first_name, last_name, email, phone, message) 
    VALUES ($1, $2, $3, $4, $5);`;

  const contact = await pool.query(
    sql,
    [fname, lname, email, phone, message],
    (err, result) => {
      if (err)
        return res.status(400).json({
          Message: "Something goes wrong. Try again",
        });

      return res.status(200).json({
        Message:
          "Thank you for contacting us! We have received your message and will get back to you as soon as possible.",
      });
    }
  );
}
