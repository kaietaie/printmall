import axios from "axios";
import fetch from "node-fetch";
import getIdAndEtc from "../../functions/getIdAndEtc.js";
import saveOrderId from "../../functions/saveOrder/saveOrderId.js";
import savePayment from "../../functions/saveOrder/savePayment.js";
import saveShippingInfo from "../../functions/saveOrder/saveShippingInfo.js";
import logger from "../../logger/logger.js";
export var order = {},
  shipping = {};

export default async function createMonoOrder(req, res) {
  const { cart, shippingInfo } = req.body; // [{quantity, sku },{quantity, sku }...]
  shipping = shippingInfo;
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
      redirectUrl: "http://localhost:3000/complete",
      // webHookUrl: "",
    };

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

    if (send.data?.errCode) {
      res.status(send.status).json(send.statusText);
    }
    console.log({ send });

    const paymentMonoId = send.data.invoiceId;

    const response = {
      url: send.data.pageUrl,
      orderId: paymentMonoId,
    };
    res.json(response);
  } catch (error) {
    console.error(error);
    const errorMsg = `createMonoOrder is failed: ${error.message}, code ${error.response.data.errCode}: ${error.response.data.errText}`;
    logger.error(errorMsg);
    res
      .status(error.response.status)
      .send({ Error: error.message, Message: error.response.data.errText });
  }
}