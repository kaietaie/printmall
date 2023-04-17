import { pool } from "../../dbConnection.js";
import logger from "../../logger/logger.js";

export default async function saveShippingInfo(shippingInfo) {
  /* income
address_line_1: ""
address_line_2: ""
city: "b1a78da1-cfab-11e0-baa0-c8912765d3f7"
country: "UA"
email: "aratatem2013@gmail.com"
first_name: "Artem"
last_name: "Smirnov"
phone: "380639366753"
region: ""
shipping_method: "nova_post"
warehouse: "1ec09d2e-e1c2-11e3-8c4a-0050568002cf"
zip_code: ""
    */
try {
  console.dir({shippingInfo})
  const sql_address = `insert into shipping_info( first_name, last_name, phone, email, 
    address_line_1, address_line_2, city, country, region, zip, shipping_method,  warehouse ) 
    values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
    RETURNING shipping_info_id;`;
    
    const addressInfo = await pool.query(sql_address, [
      shippingInfo.first_name,
      shippingInfo.last_name,
      shippingInfo.phone,
      shippingInfo.email,
      shippingInfo.address_line_1,
      shippingInfo.address_line_2,
      JSON.stringify(shippingInfo.city),
      shippingInfo.country,
      shippingInfo.region,
      shippingInfo.zip_code,
      shippingInfo.shipping_method,
      JSON.stringify(shippingInfo.warehouse)
    ]);
    return addressInfo.rows[0].shipping_info_id
  } catch (error) {
    const errorMsg = `Save shipping is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
