import fetch from "node-fetch";
import getUSDtoUAH from "../../functions/Posta/getExchange.js";

const { PAYPAL_CLIENT_ID, PAYPAL_CLIENT_SECRET } = process.env;
const base = "https://api-m.sandbox.paypal.com";

export async function createOrder(order) {
  const exchangeRate = await getUSDtoUAH();
  const shippingCost = Number((order.cart[order.cart.length - 1].price / exchangeRate).toFixed(2));
  const total = Number((order.total / exchangeRate).toFixed(2));
  const cart = [...order.cart];
  cart.pop();


  const accessToken = await generateAccessToken();
  const url = `${base}/v2/checkout/orders`;
  const response = await fetch(url, {
    method: "post",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${accessToken}`,
    },
    body: JSON.stringify({
      intent: "CAPTURE",
      purchase_units: [
        {
          amount: {
            currency_code: "EUR",
            value: total,
            breakdown: {
              shipping: {
                currency_code: "EUR",
                value: shippingCost,
              },
              item_total: {
                currency_code: "EUR",
                value: Number((total - shippingCost).toFixed(2)),
              },
            },
          },
          items: cart.map(({ name, quantity, price }) => {
            return {
              name: name,
              unit_amount: {
                currency_code: "EUR",
                value: Number((price / exchangeRate).toFixed(2)),
              },
              quantity: quantity,
            };
          }),
        },
      ],
    }),
  });
  return handleResponse(response);
}

export async function capturePayment(orderId) {
  const accessToken = await generateAccessToken();
  const url = `${base}/v2/checkout/orders/${orderId}/capture`;
  const response = await fetch(url, {
    method: "post",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${accessToken}`,
    },
  });
  return handleResponse(response);
}

// call this function to create your client token
export async function generateClientToken() {
  const accessToken = await generateAccessToken();
  const response = await fetch(`${base}/v1/identity/generate-token`, {
    method: "POST",
    headers: {
      Authorization: `Bearer ${accessToken}`,
      "Accept-Language": "en_US",
      "Content-Type": "application/json",
    },
  });
  const data = await response.json();
  return data.client_token;
}

// access token is used to authenticate all REST API requests
export async function generateAccessToken() {
  const auth = Buffer.from(
    PAYPAL_CLIENT_ID + ":" + PAYPAL_CLIENT_SECRET
  ).toString("base64");
  const response = await fetch(`${base}/v1/oauth2/token`, {
    method: "post",
    body: "grant_type=client_credentials",
    headers: {
      Authorization: `Basic ${auth}`,
    },
  });
  const jsonData = await handleResponse(response);
  return jsonData.access_token;
}

async function handleResponse(response) {
  if (response.status === 200 || response.status === 201) {
    return response.json();
  }

  const errorMessage = await response.text();
  throw new Error(errorMessage);
}
