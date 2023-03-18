import getPrice from "../../functions/getPrice.js";
import * as paypal from "./paypal-api.js";

export default async function checkout (req, res) {
 // cart (sku, qty), need to find prices and calculate sub_total amount
 const skus = req.body; // "skus": [ { "sku": "1-80-5-4", "quantity": 4 },...]
 let sub_total = 0;
 console.log(skus.skus[0].sku)
 const price = await getPrice(skus.skus[0].sku);
 sub_total = price * Number(skus.quantity)
 const client_token = await paypal.generateClientToken()
 console.log(client_token)
return res.status(200).json({client_token})
}