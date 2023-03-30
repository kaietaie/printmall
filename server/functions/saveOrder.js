import { pool } from "../dbConnection.js";
import logger from "../logger/logger.js";
import { order } from "../product/checkoutPayPal/createOrder.js";
import saveOrderId from "./saveOrder/saveOrderId.js";
import savePayment from "./saveOrder/savePayment.js";
import saveShippingInfo from "./saveOrder/saveShippingInfo.js";
export default async function saveOrder(capturedOrder) {
  // const capturedOrder = {
  //   paymentInfo: { id: , data:  },
  //   shippingInfo: {
  //      address:  {
  //          address_line_1: '',
  //          address_line_2: '',
  //          admin_area_2: 'Bratislava',
  //          admin_area_1: 'Slovenská Republika',
  //          postal_code: '821 01',
  //          country_code: 'SK'
  //           }
  //        },
  //      payer: {name: { given_name: 'John', surname: 'Doe' }, email_address : ''},
  //      phone: ''
  //      },
  //   status: captureData.status,
  // };
  try {
    const paymentId = await savePayment(capturedOrder.paymentInfo);

    const shippingId = await saveShippingInfo(capturedOrder.shippingInfo);

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
    // console.log({products})
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
