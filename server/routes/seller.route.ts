import Router from "express";
import createSeller from "../product/seller/createSeller";
import getSeller from "../product/seller/getSeller";
export const sellerRouter = Router();

sellerRouter.post('/create', createSeller )
sellerRouter.get('/:seller_name', getSeller )
sellerRouter.put('/update', )
sellerRouter.delete('/delete', )