import Router from "express";
import checkMonoPayment from "../product/checkoutMono/checkMonoPayment.js";
import createMonoOrder from "../product/checkoutMono/createMonoOrder.js";
export const paymentmonoRouter = Router();

// paymentmonoRouter.post('/checkout', checkout )
paymentmonoRouter.post('/create-mono-order', createMonoOrder )
paymentmonoRouter.get('/check-mono-payment', checkMonoPayment )
