import { pool } from "../dbConnection.js";
import emailValidation from "../functions/emailValidation.js";
import logger from "../logger/logger.js";

export default async function deleteNewsList(req, res) {
  const { email } = req.body;
  try {
    const mail = emailValidation(email)[0];
    const sql = `delete from newslist_emails 
        where newslist_email=$1`;
    await pool.query(sql, [mail]);

    return res.status(200).json({
      Message:
        "Email successfully deleted from the news list. You will no longer receive updates on our marketplace. If you change your mind, you can always resubscribe at any time. Thank you for your attention.",
    });
  } catch (error) {
    const errorMsg = `Email is failed: ${error.message}`;
    logger.error(errorMsg);
    return res.status(400).json({ Error: "Email is failed" });
  }
}
