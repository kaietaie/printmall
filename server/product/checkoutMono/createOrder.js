import axios from "axios";
import getIdAndEct from "../../functions/getIdAndEct.js";
import saveOrderId from "../../functions/saveOrder/saveOrderId.js";
import savePayment from "../../functions/saveOrder/savePayment.js";
import saveShippingInfo from "../../functions/saveOrder/saveShippingInfo.js";
import logger from "../../logger/logger.js";
export var order = {};

export default async function createMonoOrder(req, res) {
  const { cart, shippingInfo } = req.body; // [{quantity, sku },{quantity, sku }...]
  try {
    const status = "";
    const shippingId = await saveShippingInfo(shippingInfo);

    const orderId = await saveOrderId(shippingId, status); // потім додоати id_payment

    let total = 0;
    let paymentreq = {
      ccy: 980, // ISO 4217 код валюти, за замовчуванням 980 (гривня)
      merchantPaymInfo: {
        reference: orderId.toString(), // Номер замовлення
        destination: "KRAM Market purchase", // Призначення платежу
        basketOrder: [],
      },
      redirectUrl: "",
      webHookUrl: "",
      validity: 3600,
      paymentType: "debit",
    };
    for (let i = 0; i < cart.length; i++) {
      const prod = await getIdAndEct(
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
      // paymentreq.merchantPaymInfo.basketOrder.push({
      //   name: prod.product_name,
      //   qty: cart[i].quantity,
      //   sum: price * 100,
      //   code: cart[i].sku,
      // });
    }
    order = { total, cart };
    paymentreq.amount = total * 100;

    const token = req.headers["x-token"];


    const send = await axios({
      method: "post",
      url: "https://api.monobank.ua/api/merchant/invoice/create",
      headers: {
        "X-Token": token,
      },
      data: paymentreq,
    });
    console.log(send)
    res.json("ok");
  } catch (error) {
    console.error(error);
    const errorMsg = `createMonoOrder is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send(error.message);
  }
}
