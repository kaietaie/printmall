import { Request } from "express";

export interface MyRequest extends Request {
    authority: number;
    name: string
}

export interface ProductsArray extends Object {
    product_id: number,
    product_name: string,
    product_price: number,
    seller_name: string,
    colors: [{
        color: string,
        product_image: string
    }]
}