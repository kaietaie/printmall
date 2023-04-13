import Router from "express";
import addShippingAddress from "../product/addShippingAddress.js";

export const shippingRouter = Router();

shippingRouter.post('/add', addShippingAddress)
