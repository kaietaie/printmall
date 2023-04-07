import saveShippingInfo from "../functions/saveOrder/saveShippingInfo.js";

export var shippingAddress = {}, shippingCost, shippingId; 

export default async function addShippingAddress (req, res) {
    const { shippingInfo } = req.body;
    shippingAddress = shippingInfo
    shippingId = await saveShippingInfo(capturedOrder.shippingInfo);

    shippingCost = 250;
    return res.status(200).json({shippingCost})
}