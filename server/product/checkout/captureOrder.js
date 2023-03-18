import * as paypal from "./paypal-api.js";

// Call API with your client and get a response for your call
export default async function capturePayPalOrder(req, res) {
  const { orderID } = req.body;
  try {
    const captureData = await paypal.capturePayment(orderID);
    res.json(captureData);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
