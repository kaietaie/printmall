import * as paypal from "./paypal-api.js";
import saveOrder from "../../functions/saveOrder.js";
import sendConfirmationMail from "../../mailer/sendConfirmationMail.js";
import logger from "../../logger/logger.js";

// Call API with your client and get a response for your call
export default async function capturePayPalOrder(req, res) {
  const { orderID } = req.body;
  try {
    const captureData = await paypal.capturePayment(orderID);
    const data = await saveOrder(captureData);
    sendConfirmationMail(captureData, data)
    res.json({ data });
  } catch (error) {
    const errorMsg = `capturePayPalOrder is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send(error.message);
  } 
}
