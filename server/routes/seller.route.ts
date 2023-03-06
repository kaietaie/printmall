import Router from "express";
import createSeller from "../product/seller/createSeller";
export const sellerRouter = Router();

sellerRouter.post('/create', createSeller )
sellerRouter.get('/', )
sellerRouter.put('/update', )
sellerRouter.delete('/delete', )