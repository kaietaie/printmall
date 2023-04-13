import Router from "express";
import getAllOrders from "../orders/getAllOrders.js";
import editOrder from "../orders/editOrder.js";
import getOneOrder from "../orders/getOneOrder.js";

export const ordersRouter = Router();

ordersRouter.get("/all", getAllOrders);
ordersRouter.get("/:orderId", getOneOrder);
ordersRouter.put("/edit", editOrder);
