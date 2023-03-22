import * as paypal from "./paypal-api.js";
import saveOrder from "../../functions/saveOrder.js";

// Call API with your client and get a response for your call
export default async function capturePayPalOrder(req, res) {
  const { orderID } = req.body;
  try {
    const captureData = await paypal.capturePayment(orderID);
    console.dir(captureData);
    const data = await saveOrder(captureData);
    res.json({ date });
  } catch (err) {
    res.status(500).send(err.message);
  }
}
