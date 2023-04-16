import escapeHtml from "../functions/escapeHTML.js";
import logger from "../logger/logger.js";
import mailSend from "./mailer.js";

export default async function sendOrderToAdmin(dataMail) {
  try {
    let mailText;

    if (dataMail.id) {
      mailText = {
        emails: ["info@kram.market"],
        subject: `Нове замовлення`,
        html: `Нове замовлення №${dataMail.id}! <br/>
        Переглянути деталі можете в Адмін панелі.
        `,
      };
    } else if (dataMail.userMessage) {
      console.log({ dataMail });
      const { first_name, last_name, email, message, phone } =
        dataMail.userMessage;
      mailText = {
        emails: ["info@kram.market"],
        subject: `Нове звернення`,
        html: `<b>Зверненння від користувача</b> ${first_name} ${last_name}. <br/>
        <b>Тест повідомлення:</b> ${escapeHtml(message)} <br/>
        <b>Контакти: </b>
        <ul> <li>Email: ${email}</li>
        <li>Телефон: ${phone}</li>
        </ul>`,
      };
    }
    mailSend(mailText);
  } catch (error) {
    const errorMsg = `Send email to admin is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
