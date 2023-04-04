import axios from "axios";

export default async function checkStatus(orderId, token, retries) {
    const response = await axios({
        method: "get",
        url: `https://api.monobank.ua/api/merchant/invoice/status?invoiceId=${orderId}`,
        headers: {
            "X-Token": token,
        },
    });
    if (retries === 0) {
        return response.data
    }
  
    if (response.data.status === "success") {
      return response.data;
    } else {
      await new Promise(resolve => setTimeout(resolve, 250)); 
      return checkStatus(orderId, token, retries - 1); // рекурсивно викликати саму себе зі зменшенням кількості спроб
    }
  }
  