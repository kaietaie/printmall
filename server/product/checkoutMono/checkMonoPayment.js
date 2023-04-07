import { pool } from "../../dbConnection.js";
import checkMonoPaymentDetails from "../../functions/checkMonoPaymentDetails.js";
import checkStatus from "../../functions/checkMonoPaymentStatus.js";
import savePayment from "../../functions/saveOrder/savePayment.js";
import logger from "../../logger/logger.js";
import sendConfirmationMail from "../../mailer/sendConfirmationMail.js";
import { order, shippingMono } from "./createMonoOrder.js";
import getPaymentMethodText from "../../functions/getPaymentMethodText.js";

export default async function checkMonoPayment(req, res) {
  try {
    const orderId = req.body.orderId;
    const token = process.env.MONO_TOKEN;
    const statusPay = await checkStatus(orderId, token, 8);

    if (
      statusPay.status === "failure" ||
      statusPay.status === "reversed" ||
      statusPay.status === "expired"
    ) {
      return res.status(402).json("Payment is not recived");
    }
    const paymentDetails = await checkMonoPaymentDetails(orderId, token);
    const captureData = {
      paymentInfo: { id: statusPay.invoiceId, data: paymentDetails },
      shippingInfo: shippingMono,
      status: statusPay.status,
      payment_method: paymentDetails.paymentMethod,
      date: statusPay.createdDate,
    };

    const tax = 0;
    let products = [];
    for (const item in order.cart) {
      const sub_total = Number(order.cart[item].price) * Number(order.cart[item].quantity);
      products.push({
        title: order.cart[item].name,
        value: order.cart[item].price * order.cart[item].quantity,
        quantity: order.cart[item].quantity,
      });
      const sql_order_line = `insert into order_lines( order_id, product_id, item_type, price, qty, sub_total, tax, total  )
    values ($1, $2, $3, $4, $5, $6, $7, $8);`;
      await pool.query(sql_order_line, [
        statusPay.reference,
        order.cart[item].id,
        order.cart[item].type, // t-short OR delivery
        order.cart[item].price,
        order.cart[item].quantity,
        sub_total,
        tax,
        order.total,
      ]);
    }
    savePayment(captureData.paymentInfo, statusPay.reference);

    products.pop()
    const data = {
      products: products,
      taxes: tax,
      shipping: order.cart[order.cart.length-1].price,
      payment_method: getPaymentMethodText(paymentDetails.paymentMethod),
      total: order.total,
      date: statusPay.createdDate,
      order_number: statusPay.reference,
      status: statusPay.status,
    };

    sendConfirmationMail(captureData, data);
    return res.json(data);
  } catch (error) {
    console.error(error);
    const errorMsg = `createMonoOrder is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send({ Error: error.message });
  }
}
