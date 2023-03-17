import Router from "express";
import capturePayPalOrder from "../product/checkout/captureOrder.js";
import checkout from "../product/checkout/checkout.js";
import createPayPalOrder from "../product/checkout/createOrder.js";
// import payment from "../payment/payment.js";
export const paymentRouter = Router();

paymentRouter.post('/', checkout )
paymentRouter.post('/create-paypal-order', createPayPalOrder )
paymentRouter.post('/capture-paypal-order', capturePayPalOrder )
