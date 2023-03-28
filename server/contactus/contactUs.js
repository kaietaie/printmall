import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";
import mailSend from "../mailer/mailer.js";

export default async function contactUs(req, res) {
  // const { user_message } = req.body;
  const { first_name, last_name, email, phone, message } =
    req.body.user_message;
  const data = {
    emails: [email],
    subject: "Thanks for contact us!",
    text: ``,
    html: `<b>Have you already buy our t-shirts?</b> <br>
    Thank you, ${first_name}, for contacting us! We have received your message and will get back to you as soon as possible.
    `,
  };

  mailSend(data);

  const sql = `INSERT INTO contact_us (first_name, last_name, email, phone, message) 
    VALUES ($1, $2, $3, $4, $5);`;

  const contact = await pool.query(
    sql,
    [first_name, last_name, email, phone, message],
    (error, result) => {
      if (error) {
        const errorMsg = `Get product is failed: ${error.message}`;
        logger.error(errorMsg);
        return res.sendStatus(400);
      }

      return res.sendStatus(200);
    }
  );
}