import Router from "express";
import createSeller from "../product/seller/createSeller.js";
import getSeller from "../product/seller/getSeller.js";
export const sellerRouter = Router();

sellerRouter.post('/create', createSeller )
sellerRouter.get('/:seller_name', getSeller )
sellerRouter.put('/update', )
sellerRouter.delete('/delete', )