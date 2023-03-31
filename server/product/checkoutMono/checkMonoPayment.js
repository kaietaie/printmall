import axios from "axios";
import fetch from "node-fetch";
import { pool } from "../../dbConnection.js";
import checkMonoPaymentDetails from "../../functions/checkMonoPaymentDetails.js";
import checkStatus from "../../functions/checkMonoPaymentStatus.js";
import logger from "../../logger/logger.js";
import sendConfirmationMail from "../../mailer/sendConfirmationMail.js";
import { order, shipping } from "./createMonoOrder.js";

export default async function checkMonoPayment(req, res) {
  try {

    const orderId = req.body.orderId;
    const token =
      "uEBaUmpxJgFWoiK6JqoiHGTIT7gfmde-9tdYYxg8fh64" || req.headers["x-token"];
    console.log(token)
    const statusPay = await checkStatus(orderId, token, 10);
    console.log(statusPay);

    // if (
    //   statusPay.status === "failure" ||
    //   statusPay.status === "reversed" ||
    //   statusPay.status === "expired"
    // ) {
    //   return res.status(402).json("Payment is not recived");
    // }
    console.log("before details");
    const paymentDetails = await checkMonoPaymentDetails(
      orderId,
      token
    );
    console.log(paymentDetails);
    const captureData = {
      paymentInfo: { id: statusPay.invoiceId, data: paymentDetails },
      shippingInfo: {
        address: {
          address_line_1: shipping.address_line_1,
          address_line_2: shipping.address_line_2,
          admin_area_2: shipping.city,
          admin_area_1: shipping.country,
          postal_code: shipping.zip_code,
          country_code: shipping.country,
        },
        payer: {
          name: {
            given_name: shipping.first_name,
            surname: shipping.last_name,
          },
          email_address: shipping.email,
        },
        phone: shipping.phone,
      },
      status: statusPay.status,
      payment_method: paymentDetails.paymentMethod,
      date: statusPay.createdDate,
    };

    const sub_total = order.total,
      tax = 0,
      shippingCost = 0;
    let products = [];
    for (const item in order.cart) {
      products.push({
        title: order.cart[item].name,
        value: order.cart[item].price,
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

    const data = {
      products: products,
      taxes: tax,
      shipping: shippingCost,
      payment_method: paymentDetails.paymentMethod,
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
    res.status(error.response.status).send({ Error: error.message });
  }
}



/*
2303316ybxPWKwNSoURk
2303317WMYxWBHaaQKMD
*/