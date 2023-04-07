import Router from "express";
import contactUs from "../mailer/contactUs.js";

export const contactRouter = Router();

contactRouter.post('/send', contactUs)