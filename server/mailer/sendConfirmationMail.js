import logger from "../logger/logger.js";
import mailSend from "./mailer.js";

export default async function sendConfirmationMail(captureData, data) {
 try {
  
   const mailText = {
     emails: [captureData.shippingInfo.email],
     subject: `Order Confirmation`,
     text: `Order confirmation`,
     html: `<p>Dear ${captureData.shippingInfo.first_name} ${captureData.shippingInfo.last_name},</p>
     <p>We wanted to take a moment to thank you for choosing to shop with us and for placing an order on our website. This email serves as a confirmation of your order details:</p>
        <ul>
          <li>Order Number: ${data.order_number}</li>
          <li>Order Date: ${captureData.date}</li>
          <li>Shipping Address: ${captureData.shippingInfo}</li>
          <li>Order Total: ${data.total}</li>
        </ul>
        <p>We are pleased to inform you that your order has been received and is currently being processed. Our team is working diligently to ensure that your order is fulfilled and shipped as soon as possible.</p>
        <p>If you have any questions or concercaptureDatans about your order, please don't hesitate to contact us. We are always happy to help.</p>
        <p>Thank you for your business!</p>
        <p>Sincerely,</p>
        <p>The KRAM Market Team</p>`,
      };
      mailSend(mailText);
    } catch (error) {
      const errorMsg = `Send confirmation email is failed: ${error.message}`;
      logger.error(errorMsg); 
     }
}
