import Router from "express";
import capturePayPalOrder from "../product/checkoutPayPal/captureOrder.js";
import checkout from "../product/checkoutPayPal/checkout.js";
import createPayPalOrder from "../product/checkoutPayPal/createOrder.js";
// import payment from "../payment/payment.js";
export const paymentRouter = Router();

paymentRouter.post('/checkout', checkout )
paymentRouter.post('/create-paypal-order', createPayPalOrder )
paymentRouter.post('/capture-paypal-order', capturePayPalOrder )
