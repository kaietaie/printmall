import logger from "../logger/logger.js";
import mailSend from "./mailer.js";

export default async function sendOrderToAdmin(shippingAddress, data, sql_order_line) {
  try {
    const {order_id, product_id, item_type, price, qty, sub_total, tax, total} = sql_order_line.rows[0]
    console.log(sql_order_line.rows[0])
    const mailText = {
      emails: [shippingAddress.email],
      subject: `New order`,
      text: ``,
      html: `Order details:
      <table>
          <thead>
            <tr>
              <th>order_id</th>
              <th>product_id</th>
              <th>item_type</th>
              <th>price</th>
              <th>qty</th>
              <th>sub_total</th>
              <th>tax</th>
              <th>total</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>${order_id}</td>
              <td>${product_id}</td>
              <td>${item_type}</td>
              <td>${price}</td>
              <td>${qty}</td>
              <td>${sub_total}</td>
              <td>${tax}</td>
              <td>${total}</td>
            </tr>
           
          </tbody>
      </table>

      <ul>
        <li>Order Number: ${data.order_number}</li>
        <li>Order Date: ${data.date}</li>
        <li>Shipping Address:
          <ul>
            <li>${shippingAddress.first_name}</li>
            <li>${shippingAddress.last_name}</li>
            <li>${shippingAddress.address_line_1}</li>
            <li>${shippingAddress.address_line_2}</li>
            <li>${shippingAddress.city}</li>
            <li>${shippingAddress.country}</li>
            <li>${shippingAddress.region}</li>
            <li>${shippingAddress.zip_code}</li>
          </ul>
        </li>
        <li>Order Total: ${data.total}</li>
      </ul>
      <p>We are pleased to inform you that your order has been received and is currently being processed. Our team is working diligently to ensure that your order is fulfilled and shipped as soon as possible.</p>
      <p>If you have any questions or concercaptureDatans about your order, please don't hesitate to contact us. We are always happy to help.</p>
      <p>Thank you for your business!</p>
      <p>Sincerely,</p>
      <p>The Kram Market Team</p>`,
    };
    mailSend(mailText);
  } catch (error) {
    const errorMsg = `Send confirmation email is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
