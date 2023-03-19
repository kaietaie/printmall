import { pool } from "../dbConnection.js";

export default async function saveOrder(captureData) {
  try {
    const shippingInfo = captureData.purchase_units[0].shipping.address;
    // {
    //   name: { full_name: 'John Doe' },
    //   address: {
    //     address_line_1: 'Ružinovská 1',
    //     admin_area_2: 'Bratislava',
    //     admin_area_1: 'Slovenská Republika',
    //     postal_code: '821 01',
    //     country_code: 'SK'
    //   }
    // }
    console.log(shippingInfo)
    console.dir(captureData)
    const client = captureData.payer; // {name: { given_name: 'John', surname: 'Doe' },email_address:''}

    const sql = `insert into payments( paymentgateway_order_id, payment_processer_responce ) 
    values ($1, $2)
    RETURNING payment_id;`;
    
    const paymentId = await pool.query(sql, [captureData.id, captureData]);


    const phone = "+380689901426"; // Needs to take from frontend

    const sql_address = `insert into shipping_info( first_name, last_name, phone, email, 
      address_line_1, address_line_2, city, country, region, zip  ) 
      values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
      RETURNING shipping_info_id;`;

    const addressInfo = await pool.query(sql_address, [
      client.name.given_name,
      client.name.surname,
      phone,
      client.email_address,
      shippingInfo.address_line_1,
      shippingInfo.address_line_2,
      shippingInfo.admin_area_2,
      shippingInfo.admin_area_1,
      shippingInfo.country_code,
      shippingInfo.postal_code
    ]);

    let finalized = false;
    if (captureData.status === "COMPLETED") finalized = true;

    const sql_order = `insert into orders( shipping_info_id, payment_id, finalized )
    values ($1, $2, $3)
    RETURNING order_id;`;
    const order = await pool.query(sql_order, [
      addressInfo.rows[0].shipping_info_id,
      paymentId,
      finalized
    ]);
    return order.rows[0]
  } catch (error) {
    console.log(error);
    return false;
  }
}
