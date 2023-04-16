import logger from "../../logger/logger.js";
import deliveryPriceInt from "./deliveryPriceInt.js";
import { deliveryPriceNP } from "./novaPostaAPI.js";

export default async function deliveryPrice(cart, address) {
  try {
    /* income
address_line_1: ""
address_line_2: ""
city: "b1a78da1-cfab-11e0-baa0-c8912765d3f7"
country: "UA"
email: "aratatem2013@gmail.com"
first_name: "Artem"
last_name: "Smirnov"
phone: "380639366753"
region: ""
shipping_method: "nova_post"
warehouse: "1ec09d2e-e1c2-11e3-8c4a-0050568002cf"
zip_code: ""
    */
    let subtotal = 0,
      qty = 0;
    cart.forEach((el) => {
      subtotal += el.price;
      qty += el.quantity;
    });
    const deliveryData = {
      country: address.country,
      city: address.city.value,
      price: subtotal,
      weight: qty * 200,
    };
    let deliveryPrice;
    if (address.shipping_method === "ukr_post") {
      deliveryPrice = await deliveryPriceInt(deliveryData);
    }
    if (address.shipping_method === "nova_post") {
      deliveryPrice = await deliveryPriceNP(deliveryData);
    }

    return deliveryPrice;
  } catch (error) {
    const errorMsg = `Delivery price calculation is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
