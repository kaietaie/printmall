import { shippingCost } from "../product/addShippingAddress.js";
import getIdAndEtc from "./getIdAndEtc.js";
export var order = {};
export default async function makingCart(cart, paymentreq) {
  let total = 0;
  
  for (let i = 0; i < cart.length; i++) {
    const prod = await getIdAndEtc(
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
    if (paymentreq){
    paymentreq.merchantPaymInfo.basketOrder.push({
      name: prod.product_name,
      qty: cart[i].quantity,
      sum: price * 100,
      code: cart[i].sku,
    });}
  }
  cart.push({
    price: shippingCost,
    quantity: 1,
    type: "Shipping",
  });
  total += cart[cart.length - 1].price;
  order = { total, cart };
  if (paymentreq){
    return {paymentreq, order}
  }
  return order;
}
