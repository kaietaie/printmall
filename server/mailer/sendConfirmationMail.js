import { order } from "../product/checkoutPayPal/createOrder.js";
import mailSend from "./mailer.js";

export default async function sendConfirmationMail(captureData, dataOrder) {
 try {
  
   const data = {
     emails: [captureData.payer.email_address],
     subject: `Order Confirmation`,
     text: `Order confirmation`,
     html: `<p>Dear ${captureData.payer.name.given_name} ${captureData.payer.name.surname},</p>
     <p>We wanted to take a moment to thank you for choosing to shop with us and for placing an order on our website. This email serves as a confirmation of your order details:</p>
        <ul>
          <li>Order Number: ${dataOrder.id}</li>
          <li>Order Date: ${captureData.purchase_units[0].payments.captures[0].create_time}</li>
          <li>Shipping Address: ${captureData.purchase_units[0].shipping.address}</li>
          <li>Order Total: ${order.total}</li>
        </ul>
        <p>We are pleased to inform you that your order has been received and is currently being processed. Our team is working diligently to ensure that your order is fulfilled and shipped as soon as possible.</p>
        <p>If you have any questions or concerns about your order, please don't hesitate to contact us. We are always happy to help.</p>
        <p>Thank you for your business!</p>
        <p>Sincerely,</p>
        <p>The KRAM Market Team</p>`,
      };
      mailSend(data);
    } catch (error) {
      const errorMsg = `Get product is failed: ${error.message}`;
      logger.error(errorMsg); 
     }
}
