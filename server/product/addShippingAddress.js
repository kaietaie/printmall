import deliveryPrice from "../functions/Posta/deliveryPrice.js";
import saveShippingInfo from "../functions/saveOrder/saveShippingInfo.js";

export var shippingAddress = {}, shippingCost, shippingId; 

export default async function addShippingAddress (req, res) {
    const { shippingInfo, cart } = req.body;
    shippingAddress = shippingInfo
    shippingId = await saveShippingInfo(shippingInfo);
    shippingCost = await deliveryPrice(cart, shippingInfo);
    return res.status(200).json(shippingCost)
}