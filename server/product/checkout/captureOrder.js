import * as paypal from "../../payment/paypal-api.js";

const total_price = 125;

// Call API with your client and get a response for your call
export default async function captureOrder(req, res) {
  const { orderID } = req.body;
  try {
    const captureData = await paypal.capturePayment(orderID);
    res.json(captureData);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
