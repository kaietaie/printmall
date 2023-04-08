import saveShippingInfo from "../functions/saveOrder/saveShippingInfo.js";

export var shippingAddress = {}, shippingCost, shippingId; 

export default async function addShippingAddress (req, res) {
    const { shippingInfo } = req.body;
    shippingAddress = shippingInfo
    console.log({shippingInfo})
    shippingId = await saveShippingInfo(shippingInfo);
    console.log({shippingId})
    shippingCost = 250;
    return res.status(200).json({shippingCost})
}