import { pool } from "../dbConnection.js";
import { order } from "../product/checkout/createOrder.js";
import saveOrderId from "./saveOrder/saveOrderId.js";
import savePayment from "./saveOrder/savePayment.js";
import saveShippingInfo from "./saveOrder/saveShippingInfo.js";
export default async function saveOrder(captureData) {
  try {
    const paymentId = await savePayment(captureData);

    const shippingId = await saveShippingInfo(captureData);

    const orderId = await saveOrderId(shippingId, paymentId, captureData);
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
    const sub_total = order.total,
      tax = 0,
      shipping = 0;
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
console.log({products})
    // const data = {
    //   products: [
    //     { title: 'Custom Printed T-Shirt', value: '230', quantity: 1 },
    //     { title: 'Ocean View Tee', value: '270', quantity: 1 },
    //   ],
    //   taxes: 10,
    //   shipping: 10,
    //   payment_method:  'PayPal',
    //   total: 500,
    //   date: 123423413,
    //   order_number: 234,
    // };
    const data = {
      products: products,
      taxes: tax,
      shipping: shipping,
      payment_method:  'PayPal',
      total: order.total, 
      date: captureData.purchase_units[0].payments.captures[0].create_time,
      order_number: orderId,
      status: captureData.status,
    };

    return data;
  } catch (error) {
    console.log(error);
    return false;
  }
}
