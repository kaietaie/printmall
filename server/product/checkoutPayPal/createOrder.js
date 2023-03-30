import * as paypal from "./paypal-api.js";
import getPriceOrName from "../../functions/getIdAndEct.js";
import logger from "../../logger/logger.js";
export var order = {};

export default async function createPayPalOrder(req, res) {
  const { cart } = req.body; // [{quantity, sku },{quantity, sku }...]
  let total = 0;
  for (let i = 0; i < cart.length; i++) {
    const prod = await getPriceOrName(
      cart[i].sku,
      "product_price, product_name, product_type"
    );
    const price = prod.product_price;
    const sub_total = price * Number(cart[i].quantity);
    total += sub_total;
    cart[i].name = prod.product_name;
    cart[i].price = price;
    cart[i].id = prod.id;
    cart[i].type = prod.product_type;
  }
  order = { total, cart };
  try {
    const createData = await paypal.createOrder(order);
    res.json(createData);
  } catch (error) {
    const errorMsg = `createPayPalOrder is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send(error.message);
  }
}
