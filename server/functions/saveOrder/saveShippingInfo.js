import { pool } from "../../dbConnection.js";

export default async function saveShippingInfo(shippingInfo) {
    const address = shippingInfo.address;
    // {
    //   address: {
    //     address_line_1: 'Ružinovská 1',
    //     admin_area_2: 'Bratislava',
    //     admin_area_1: 'Slovenská Republika',
    //     postal_code: '821 01',
    //     country_code: 'SK'
    //   }
    // }
    const client = shippingInfo.payer; // {name: { given_name: 'John', surname: 'Doe' },email_address:''}

    const phone = shippingInfo.phone || "+380689901426"; // Needs to take from frontend

    const sql_address = `insert into shipping_info( first_name, last_name, phone, email, 
      address_line_1, address_line_2, city, country, region, zip  ) 
      values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
      RETURNING shipping_info_id;`;

    const addressInfo = await pool.query(sql_address, [
      client.name.given_name,
      client.name.surname,
      phone,
      client.email_address,
      address.address_line_1,
      address.address_line_2,
      address.admin_area_2,
      address.admin_area_1,
      address.country_code,
      address.postal_code,
    ]);

    return addressInfo.rows[0].shipping_info_id
}
