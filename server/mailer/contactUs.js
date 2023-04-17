import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";
import mailSend from "./mailer.js";
import sendOrderToAdmin from "./sendOrderToAdmin.js";

export default async function contactUs(req, res) {
  // const { user_message } = req.body;
  const { first_name, last_name, email, phone, message, lang } =
    req.body.user_message;
  const enText = `Dear ${first_name},

    Thank you for contacting our company. We would like to inform you that we have received your inquiry and our specialists have already started working on it.
    
    If necessary, we will contact you to obtain additional information or provide you with an answer to your inquiry. We guarantee that we will work on your request as quickly as possible.
    
    Thank you for your trust in our company. If you have any further questions, please do not hesitate to contact us. We are always ready to help you.
    
    Best regards,
    The Kram Market team
    `;
  const uaText = `Шановний(а) ${first_name}!

    Дякуємо вам за звернення до нашої компанії. Ми повідомляємо вам, що успішно отримали ваш запит і наші фахівці вже приступили до його обробки.
    
    Якщо необхідно, ми зв'яжемося з вами для отримання додаткової інформації або надамо вам відповідь на ваш запит. Ми гарантуємо вам, що будемо працювати над вашим запитом якомога швидше.
    
    Дякуємо вам за довіру до нашої компанії. Якщо у вас виникнуть додаткові запитання, будь ласка, зв'яжіться з нами. Ми завжди готові допомогти вам.
    
    З повагою,
    Команда Крам Маркет
    `;
  const data = {
    emails: [email],
    subject: "Thanks for contact us!",
    text: ``,
    html: ``,
  };
  lang === "ua" ? (data.html = uaText) : (data.html = enText);

  mailSend(data);
  const dataMail = { userMessage:  { first_name, last_name, email, phone, message, lang }};
  sendOrderToAdmin(dataMail);

  const sql = `INSERT INTO contact_us (first_name, last_name, email, phone, message) 
    VALUES ($1, $2, $3, $4, $5);`;

  const contact = await pool.query(
    sql,
    [first_name, last_name, email, phone, message],
    (error, result) => {
      if (error) {
        const errorMsg = `Get product is failed: ${error.message}`;
        logger.error(errorMsg);
        return res.sendStatus(400);
      }

      return res.sendStatus(200);
    }
  );
}
