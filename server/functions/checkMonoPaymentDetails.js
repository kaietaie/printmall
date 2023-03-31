import axios from "axios";

export default async function checkMonoPaymentDetails(orderId, token) {
    const response = await axios({
        method: "get",
        url: `https://api.monobank.ua/api/merchant/invoice/payment-info?invoiceId=${orderId}`,
        headers: {
            "X-Token": token,
        },
    });
 
      return response.data;
  }
  