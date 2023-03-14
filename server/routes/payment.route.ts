import Router from "express";
import payment from "../payment/payment";
export const paymentRouter = Router();

paymentRouter.get('/', payment )
