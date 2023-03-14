import { Request, Response } from "express";
import paypal from "@paypal/checkout-server-sdk";

const basket = new Map([
    [1, { price: 100, name: "Learn React Today" }],
    [2, { price: 200, name: "Learn CSS Today" }],
  ])
const shipping_cost = '12'

const Environment =
  process.env.NODE_ENV === "production"
    ? paypal.core.LiveEnvironment
    : paypal.core.SandboxEnvironment
const paypalClient = new paypal.core.PayPalHttpClient(
  new Environment(
    process.env.PAYPAL_CLIENT_ID,
    process.env.PAYPAL_CLIENT_SECRET
  )
)


export default async function payment (req: Request, res: Response) {
  //   const request = new paypal.orders.OrdersCreateRequest()
  // const total = req.body.items.reduce((sum, item) => {
  //   return sum + basket.get(item.id).price * item.quantity
  // }, 0)
  // request.prefer("return=representation")
  // request.requestBody({
  //   intent: "CAPTURE",
  //   purchase_units: [
  //     {
  //       amount: {
  //         currency_code: "EUR",
  //         value: total,
  //         breakdown: {
  //           item_total: {
  //             currency_code: "EUR",
  //             value: total,
  //           },
  //           shipping: {
  //               currency_code: "EUR",
  //               value: shipping_cost,
  //           },
  //         },
  //       },
  //       items: req.body.items.map(item => {
  //         const storeItem = basket.get(item.id)
  //         return {
  //           name: storeItem.name,
  //           unit_amount: {
  //             currency_code: "EUR",
  //             value: storeItem.price,
  //           },
  //           quantity: item.quantity,
  //         }
  //       }),
  //     },
  //   ],
  // })

  try {
    // const order = await paypalClient.execute(request)
    res.render("/paypal_button/checkout")
    // { id: order.result.id })
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
}