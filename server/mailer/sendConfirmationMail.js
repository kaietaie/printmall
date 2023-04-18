import logger from "../logger/logger.js";
import { shippingAddress } from "../product/addShippingAddress.js";
import mailSend from "./mailer.js";

export default async function sendConfirmationMail(data) {
  try {
    let mailText;
    const { shipping_method } = shippingAddress;
    if (shipping_method === "ukr_post") {
      const {
        email,
        first_name,
        last_name,
        address_line_1,
        address_line_2,
        city,
        country,
        region,
        zip_code,
      } = shippingAddress;
      mailText = {
        emails: [email],
        subject: `Order Confirmation`,
        text: `Order confirmation`,
        html: `<p>Dear ${first_name} ${last_name},</p>
     <p>We wanted to take a moment to thank you for choosing to shop with us and for placing an order on our website. This email serves as a confirmation of your order details:</p>
        <ul>
          <li>Order Number: ${data.order_number}</li>
          <li>Order Date: ${new Date(data.date)
            .toISOString()
            .replace(/T/, " ")
            .slice(0, -5)}</li>
          <li>Shipping Address:
            <ul>
              <li>${country}</li>
              <li>${zip_code}</li>
              <li>${city.label}</li>
              <li>${region}</li>
              <li>${address_line_1}</li>
              <li>${address_line_2}</li>
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
    } else if (shipping_method === "nova_post") {
      const { email, first_name, last_name, city, country, warehouse } =
        shippingAddress;
      mailText = {
        emails: [email],
        subject: `Підтвердження замовлення`,
        text: `Підтвердження замовлення`,
        html: `<p> ${first_name} ${last_name},</p>
     <p>Ми хотіли б подякувати вам за те, що ви вибрали робити покупки у нас і зробили замовлення на нашому веб-сайті. Цей електронний лист служить підтвердженням деталей вашого замовлення:</p>
        <ul>
          <li>Номер замовлення: ${data.order_number}</li>
          <li>Дата: ${new Date(data.date)
            .toISOString()
            .replace(/T/, " ")
            .slice(0, -5)}</li>
          <li>Доставка до відділення Нової Пошти:
            <ul>
              <li>${city.label}</li>
              <li>${warehouse.label}</li>
            </ul>
          </li>
          <li>Загальна сума: ${data.total}</li>
        </ul>
        <p>Ми раді повідомити вам, що ваше замовлення отримано та наразі обробляється. Наша команда старанно працює над тим, щоб ваше замовлення було виконано та доставлено якомога швидше.</p>
         <p>Якщо у вас виникли запитання чи сумніви щодо вашого замовлення, будь ласка, не соромтеся зв’язатися з нами. Ми завжди раді допомогти.</p>
         <p>Дякуємо за вашу справу!</p>
         <p>З повагою,</p>
         <p>Команда Kram Market</p>`,
      };
    }
    mailSend(mailText);
  } catch (error) {
    const errorMsg = `Send confirmation email is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
