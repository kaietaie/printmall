import * as paypal from "./paypal-api.js";
import getPriceOrName from "../../functions/getPrice.js";

export default async function createPayPalOrder(req, res) {
  const { cart } = req.body; // [{quantity, sku },{quantity, sku }...]
  let total = 0;
  for (let i = 0; i < cart.length; i++) {
    const price = await getPriceOrName(cart[i].sku, "product_price");
    const name = await getPriceOrName(cart[i].sku, "product_name");
    const sub_total = price.product_price * Number(cart[i].quantity);
    total += sub_total;
    cart[i].name = name.product_name;
    cart[i].price = price.product_price;
  }
  console.log(cart);
  const order = { total, cart };
  try {
    const createData = await paypal.createOrder(order);
    const paymentId = await saveToDB(createData);
    if(createData.status === "CREATED") {
      // const makeOrder = await makeOrder()
    }
    res.json(paymentId);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
