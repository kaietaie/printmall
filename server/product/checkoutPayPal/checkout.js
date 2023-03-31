import getPrice from "../../functions/getIdAndEtc.js";

export default async function checkout (req, res) {
 // cart (sku, qty), need to find prices and calculate sub_total amount
 const skus = req.body; // "skus": [ { "sku": "1-80-5-4", "quantity": 4 },...]
 // траба створити запис з БД, ініціалізувати ордер, 
 // створюється order(order_id), order_lines (product_id, item_type, price, qty) 

//  let sub_total = 0;
//  const price = await getPrice(skus.skus[0].sku);
//  sub_total = price * Number(skus.quantity)
return res.status(200)
}