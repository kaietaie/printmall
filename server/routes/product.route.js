import Router from "express";
import createProduct from "../product/poductCard/createProduct.js";
import getProduct from "../product/poductCard/getProduct.js";
import getAdminProduct from "../adminpanel/getAdminProduct.js";
export const productRouter = Router();

productRouter.post('/create', createProduct)
productRouter.get('/', getProduct)
productRouter.get('/:id', getProduct)
productRouter.put('/update', )
productRouter.delete('/delete', )

productRouter.get('/foradmin/:id', getAdminProduct)
