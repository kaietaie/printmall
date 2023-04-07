import { pool } from "../../dbConnection.js";

export default async function saveShippingInfo(shippingInfo) {
  // {
  //   address_line_1: "м. Березань, вул. Шевченків шлях, б. 112, кв 10";
  //   address_line_2: "м. Березань, вул. Шевченків шлях, б. 112, кв 10";
  //   city: "Berezan";
  //   country: "UA";
  //   email: "aratatem2013@gmail.com";
  //   first_name: "фіуа";
  //   last_name: "Smirnov";
  //   phone: "380639366753";
  //   region: "Київська область";
  //   zip_code: "07540";
  // }
try {
  
  const sql_address = `insert into shipping_info( first_name, last_name, phone, email, 
    address_line_1, address_line_2, city, country, region, zip  ) 
    values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
    RETURNING shipping_info_id;`;
    
    const addressInfo = await pool.query(sql_address, [
      shippingInfo.first_name,
      shippingInfo.last_name,
      shippingInfo.phone,
      shippingInfo.email,
      shippingInfo.address_line_1,
      shippingInfo.address_line_2,
      shippingInfo.city,
      shippingInfo.country,
      shippingInfo.region,
      shippingInfo.zip_code,
    ]);
    
    return addressInfo.rows[0].shipping_info_id
  } catch (error) {
    const errorMsg = `Save shipping is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
