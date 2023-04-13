import * as paypal from "./paypal-api.js";
import saveOrder from "../../functions/saveOrder.js";
import sendConfirmationMail from "../../mailer/sendConfirmationMail.js";
import logger from "../../logger/logger.js";
import { shippingAddress } from "../addShippingAddress.js";

// Call API with your client and get a response for your call
export default async function capturePayPalOrder(req, res) {
  const { orderId } = req.body;
  try {
    const captureData = await paypal.capturePayment(orderId);

    const capturedOrder = {
      paymentInfo: { id: captureData.id, data: captureData },
      shippingInfo: shippingAddress,
      status: captureData.status,
      payment_method: "PayPal",
      date: captureData.purchase_units[0].payments.captures[0].create_time,
    };
    const data = await saveOrder(capturedOrder);
    sendConfirmationMail(captureData, data);
    // sendOrderToAdmin(shippingAddress, data, sql_order_line);
    res.json(data);
  } catch (error) {
    const errorMsg = `capturePayPalOrder is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send(error.message);
  }
}
