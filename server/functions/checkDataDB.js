import { pool } from "../dbConnection.js";

export default async function checkDataDB(id, table) {
  try {
    const normtable = table.slice(0, table.length - 1);
    let sql
    if (typeof id === 'number') {
    sql = `SELECT * from ${table} WHERE ${normtable}_id=${id};`;}
    if (typeof id === 'string') {
      if(table === "newslist_emails") {
    sql = `SELECT * from ${table} WHERE ${normtable}='${id}';`;
      } else {
    sql = `SELECT * from ${table} WHERE ${normtable}_name='${id}';`;
      }
    }
    const find = await pool.query(sql);
    console.log(find.rows )
    // if (
    //   find?.rows[0]?.archivated === true ||
    //   find?.rows[0]?.enabled === false
    // ) {
    //   return false;
    // }
    if (find?.rowCount === 1) {
      return true;
    }
    return false;
  } catch (error) {
    console.log(error);
    return false;
  }
}
