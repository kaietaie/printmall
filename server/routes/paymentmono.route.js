import Router from "express";
import createMonoOrder from "../product/checkoutMono/createOrder.js";
export const paymentmonoRouter = Router();

// paymentmonoRouter.post('/checkout', checkout )
paymentmonoRouter.post('/create-mono-order', createMonoOrder )
// paymentmonoRouter.post('/capture-paypal-order', capturePayPalOrder )