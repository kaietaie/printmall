import Router from "express";
import capturePayPalOrder from "../product/checkoutPayPal/captureOrder.js";
import createPayPalOrder from "../product/checkoutPayPal/createOrder.js";

export const paymentRouter = Router();

paymentRouter.post('/create-paypal-order', createPayPalOrder )
paymentRouter.post('/capture-paypal-order', capturePayPalOrder )
