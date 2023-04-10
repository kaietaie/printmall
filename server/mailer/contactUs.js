import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";
import mailSend from "./mailer.js";

export default async function contactUs(req, res) {
  // const { user_message } = req.body;
  const { first_name, last_name, email, phone, message } =
    req.body.user_message;
  const data = {
    emails: [email],
    subject: "Thanks for contact us!",
    text: ``,
    html: `Dear ${first_name},\n
    Thank you for contacting us. We appreciate your interest in our products.\n

    In order for us to better assist you, please provide us with additional information about your inquiry. This may include details such as your order number, account information, or specific details about the issue you are experiencing.\n
    
    Once we receive this information, we will do our best to provide you with a timely response. Thank you for your patience and we look forward to resolving your inquiry.\n
    <br>
    Best regards,
<br>
    Kram Market team
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
