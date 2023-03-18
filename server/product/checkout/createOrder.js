import * as paypal from "./paypal-api.js";
import getPrice from "../../functions/getPrice.js";

export default async function createPayPalOrder(req, res) {
  const { quantity, sku } = req.body.cart;
  const price = await getPrice(sku);
  const total = price * Number(quantity);
  const order = { sku, quantity, total };
  try {
    const createData = await paypal.createOrder(order);
    res.json(createData);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
