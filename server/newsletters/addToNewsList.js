import { pool } from "../dbConnection.js";
import checkDataDB from "../functions/checkDataDB.js";
import emailValidation from "../functions/emailValidation.js";
export default async function addToNewsList(req, res) {
  const { email } = req.body;
  try {
      const mail = emailValidation(email)[0];
      const check = await checkDataDB(mail, "newslist_emails")
      if(!check) {
          const sql = `insert into newslist_emails (newslist_email) 
          values ($1)`;
          await pool.query(sql,[mail]);
          
          return res
          .status(200)
          .json({ Message: "Your email was added successfuly!" });
        } else {
            return res.status(400).json({ Error: "Email already was added" });
        }
  } catch (error) {
    return res.status(400).json({ Error: "Email is failed" });
  }
}
