import deliveryPrice  from "../functions/Posta/deliveryPrice.js";
import saveShippingInfo from "../functions/saveOrder/saveShippingInfo.js";

export var shippingAddress = {},
  shippingCost,
  shippingId,
  cart;

export default async function addShippingAddress(req, res) {
  const { shippingInfo } = req.body;
  shippingAddress = shippingInfo;
  cart = req.body.cart;
  shippingId = await saveShippingInfo(shippingInfo);
  shippingCost = await deliveryPrice(cart, shippingInfo);
  return res.status(200).json({ shippingCost });
}
