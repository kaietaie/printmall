import * as paypal from "./paypal-api.js";
import logger from "../../logger/logger.js";
import makingCart from "../../functions/makingCart.js";
import { cart } from "../addShippingAddress.js";

export default async function createPayPalOrder(req, res) {
  try {
 
    const orderCart = await makingCart(cart)
    console.dir(orderCart.cart)
    const createData = await paypal.createOrder(orderCart);
    res.json(createData);
  } catch (error) {
    const errorMsg = `createPayPalOrder is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send(error.message);
  }
}
