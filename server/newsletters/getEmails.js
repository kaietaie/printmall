import { pool } from "../dbConnection.js";
export default async function getEmails(req, res) {
  const sql = "select array_agg(newslist_email) from newslist_emails;";
  const result = await pool.query(sql);

  return res
    .status(200)
    .json( result.rows[0].array_agg)
}
