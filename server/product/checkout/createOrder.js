// import paypal from "@paypal/checkout-server-sdk";
import * as paypal from "./paypal-api.js";

// const Environment =
//   process.env.NODE_ENV === "production"
//     ? paypal.core.LiveEnvironment
//     : paypal.core.SandboxEnvironment;
// const paypalClient = new paypal.core.PayPalHttpClient(
//   new Environment(
//     process.env.PAYPAL_CLIENT_ID,
//     process.env.PAYPAL_CLIENT_SECRET
//   )
// );
// Call API with your client and get a response for your call
export default async function createPayPalOrder(req, res) {
    // const { order } = req.body;
    const { quantity, sku } = req.body.cart;
    const total = 42;
    const order = { sku, quantity, total}
    try {
      const createData = await paypal.createOrder(order);
      res.json(createData);
    } catch (err) {
      res.status(500).send(err.message);
    }

  }
//   const request = new paypal.orders.OrdersCreateRequest();
//   // const total = req.body.items.reduce((sum, item) => {
//   //   return sum + storeItems.get(item.id).price * item.quantity;
//   // }, 0);
//   request.prefer("return=representation");
//   request.requestBody({
//     intent: "CAPTURE",
//     purchase_units: [
//       {
//         description: "some product",
//         amount: {
//           currency_code: "EUR",
//           value: total,
//           breakdown: {
//             item_total: {
//               currency_code: "EUR",
//               value: total,
//             },
//           },
//         },
//         items:
//           // req.body.items.map((item) => {
//           //   const storeItem = storeItems.get(item.id);
//           //   return {
//           {
//             name: sku,
//             unit_amount: {
//               currency_code: "EUR",
//               value: total,
//             },
//             quantity: quantity,
//           },
//       },
//     ],
//   });

//   try {
//     console.log("in try section") 
//     const order = await paypalClient.execute(request);
//     console.log(order);
//     res.json({ id: order.result.id });
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// }
