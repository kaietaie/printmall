import { Request, Response } from "express";
import paypal from "@paypal/checkout-server-sdk";

const Environment =
  process.env.NODE_ENV === "production"
    ? paypal.core.LiveEnvironment
    : paypal.core.SandboxEnvironment;
const paypalClient = new paypal.core.PayPalHttpClient(
  new Environment(
    process.env.PAYPAL_CLIENT_ID,
    process.env.PAYPAL_CLIENT_SECRET
  )
);
// Call API with your client and get a response for your call
export default async function createPayPalOrder(req: Request, res: Response) {
  const request = new paypal.orders.OrdersCreateRequest();
  const total = req.body.items.reduce((sum, item) => {
    return sum + storeItems.get(item.id).price * item.quantity;
  }, 0);
  request.prefer("return=representation");
  request.requestBody({
    intent: "CAPTURE",
    purchase_units: [
      {
        description: "some product",
        amount: {
          currency_code: "EUR",
          value: total,
          breakdown: {
            item_total:{
              currency_code: "EUR",
              value: total
            }
            
          }
        },
        items: req.body.items.map((item) => {
          const storeItem = storeItems.get(item.id);
          return {
            name: storeItem.name,
            unit_amount: {
              currency_code: "EUR",
              value: storeItem.price,
            },
            quantity: item.quantity,
          };
        }),
      },
    ],
  });

  try {
    const order = await paypalClient.execute(request);
    console.log(order);
    res.json({ id: order.result.id });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
}
