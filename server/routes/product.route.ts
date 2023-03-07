import Router from "express";
import createProduct from "../product/poductCard/createProduct";
import getProduct from "../product/poductCard/getProduct";
export const productRouter = Router();

productRouter.post('/create', createProduct)
productRouter.get('/', getProduct)
productRouter.get('/:id', getProduct)
productRouter.put('/update', )
productRouter.delete('/delete', )