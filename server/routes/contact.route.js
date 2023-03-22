import Router from "express";
import contactUs from "../contactus/contactUs.js";

export const contactRouter = Router();

contactRouter.post('/send', contactUs)