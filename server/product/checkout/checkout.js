import getPrice from "../../functions/getPrice.js";

export default async function checkout (req, res) {
 // cart (sku, qty), need to find prices and calculate sub_total amount
 const order = req.body.order; // "order": [ { "sku": "1-80-5-4", "quantity": 4 },...]
 let sub_total = 0;
 
 const price = await getPrice(order.sku);
 sub_total = price * Number(order.quantity)
return res.status(200).json({sub_total})
}