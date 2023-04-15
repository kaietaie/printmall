import Router from "express";
import getAllOrders from "../adminpanel/getAllOrders.js";
import editOrder from "../adminpanel/editOrder.js";
import getOneOrder from "../adminpanel/getOneOrder.js";

export const ordersRouter = Router();

ordersRouter.get("/all", getAllOrders);
ordersRouter.get("/:orderId", getOneOrder);
ordersRouter.put("/edit", editOrder);
