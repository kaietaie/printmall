import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";
import { shippingId } from "../product/addShippingAddress.js";
import { order } from "./makingCart.js";
import saveOrderId from "./saveOrder/saveOrderId.js";
import savePayment from "./saveOrder/savePayment.js";
import saveShippingInfo from "./saveOrder/saveShippingInfo.js";
export default async function saveOrder(capturedOrder) {
  try {
    const paymentId = await savePayment(capturedOrder.paymentInfo);

    // const shippingId = await saveShippingInfo(capturedOrder.shippingInfo);

    const orderId = await saveOrderId(shippingId, paymentId, capturedOrder.status);
    // order =  {
    //   total: 144,
    //   cart: [
    //     {
    //       sku: '1-63-4-2',
    //       quantity: 2,
    //       name: 'Tee Artistry Tenis',
    //       price: 72,
    //       id: 63,
    //       type: null
    //     }
    //   ]
    // }

    const  tax = 0;
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
        orderId,
        order.cart[item].id,
        order.cart[item].type, // t-short OR delivery
        order.cart[item].price,
        order.cart[item].quantity,
        sub_total,
        tax,
        order.total,
      ]);
    }
    products.pop()
    const data = {
      products: products,
      taxes: tax,
      shipping: order.cart[order.cart.length-1].price,
      payment_method: capturedOrder.payment_method,
      total: order.total,
      date: capturedOrder.date,
      order_number: orderId,
      status: capturedOrder.status,
    };

    return data;
  } catch (error) {
    console.error(error);
    const errorMsg = `Save order is failed: ${error.message}`;
    logger.error(errorMsg);
    return false;
  }
}
