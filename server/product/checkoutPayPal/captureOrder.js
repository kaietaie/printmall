import * as paypal from "./paypal-api.js";
import saveOrder from "../../functions/saveOrder.js";
import sendConfirmationMail from "../../mailer/sendConfirmationMail.js";
import logger from "../../logger/logger.js";

// Call API with your client and get a response for your call
export default async function capturePayPalOrder(req, res) {
  const { orderID } = req.body;
  try {
    const captureData = await paypal.capturePayment(orderID);

    const capturedOrder = {
      paymentInfo: { id: captureData.id, data: captureData },
      shippingInfo: {
        address: captureData.purchase_units[0].shipping.address,
        payer: captureData.payer,
      },
      status: captureData.status,
      payment_method: "PayPal",
      date: captureData.purchase_units[0].payments.captures[0].create_time,
    };
    console.log(capturedOrder);
    const data = await saveOrder(capturedOrder);
    sendConfirmationMail(captureData, data);
    res.json({ data });
  } catch (error) {
    const errorMsg = `capturePayPalOrder is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send(error.message);
  }
}
