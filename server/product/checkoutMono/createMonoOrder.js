import axios from "axios";
import saveOrderId from "../../functions/saveOrder/saveOrderId.js";
import logger from "../../logger/logger.js";
import makingCart from "../../functions/makingCart.js";
import { shippingId } from "../addShippingAddress.js";

export default async function createMonoOrder(req, res) {
  try {
    const { cart } = req.body;
    const status = "";
    const orderId = await saveOrderId(shippingId, status); // потім додоати id_payment

    let paymentreq = {
      ccy: 980, // ISO 4217 код валюти, за замовчуванням 980 (гривня)
      merchantPaymInfo: {
        reference: orderId.toString(), // Номер замовлення
        destination: "Kram Market purchase", // Призначення платежу
        basketOrder: [],
      },
      redirectUrl: "http://" + process.env.REACT_APP_HOST + "/checkpayment",
      // webHookUrl: "",
    };
console.log({cart})
    const orderCart = await makingCart(cart, paymentreq); // order = { total, cart };
    const total = orderCart.order.total;
    paymentreq.amount = total * 100;

    const token = process.env.MONO_TOKEN;

    const send = await axios({
      method: "post",
      url: "https://api.monobank.ua/api/merchant/invoice/create",
      headers: {
        "X-Token": token,
      },
      data: orderCart.paymentreq,
    });

    if (send.data?.errCode) {
      const errorMsg = `createMonoOrder is failed. ErrCode: ${send.data?.errCode}`;
      logger.error(errorMsg);
      res.status(send.status).json(send.statusText);
    }

    const response = {
      url: send.data.pageUrl,
      orderId: send.data.invoiceId,
    };
    res.json(response);
  } catch (error) {
    console.error(error);
    const errorMsg = `createMonoOrder is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(error);
  }
}
