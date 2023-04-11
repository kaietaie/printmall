import Router from "express";
import ukrposhtaDeliveryPriceInternational from "../functions/Posta/ukrPosta.js";

export const ukrpostaRouter = Router();

ukrpostaRouter.get('/interdeliveryprice', ukrposhtaDeliveryPriceInternational)
