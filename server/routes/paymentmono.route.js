import Router from "express";
import checkMonoPayment from "../product/checkoutMono/checkMonoPayment.js";
import createMonoOrder from "../product/checkoutMono/createMonoOrder.js";

export const paymentmonoRouter = Router();

paymentmonoRouter.post('/create-mono-order', createMonoOrder )
paymentmonoRouter.post('/check-mono-payment', checkMonoPayment )
