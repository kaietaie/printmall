import * as paypal from "./paypal-api.js";
import getIdAndEtc from "../../functions/getIdAndEtc.js";
import logger from "../../logger/logger.js";
import makingCart from "../../functions/makingCart.js";
export var shippingPal = {};

export default async function createPayPalOrder(req, res) {
  const { cart, shippingInfo } = req.body;// [{quantity, sku },{quantity, sku }...]
  shippingPal = shippingInfo; 
  // let total = 0;
  try {
  // for (let i = 0; i < cart.length; i++) {
  //   const prod = await getIdAndEtc(
  //     cart[i].sku,
  //     "product_price, product_name, product_type"
  //   );
  //   const price = prod.product_price;
  //   const sub_total = price * Number(cart[i].quantity);
  //   total += sub_total;
  //   cart[i].name = prod.product_name;
  //   cart[i].price = price;
  //   cart[i].id = prod.id;
  //   cart[i].type = prod.product_type;
  // }
  // order = { total, cart };
  const orderCart = await makingCart(cart)
    const createData = await paypal.createOrder(orderCart);
    res.json(createData);
  } catch (error) {
    const errorMsg = `createPayPalOrder is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send(error.message);
  }
}
