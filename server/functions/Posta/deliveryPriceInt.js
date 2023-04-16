import logger from "../../logger/logger.js";
import axios from "axios";
import getUSDtoUAH from "./getExchange.js";

export default async function deliveryPriceInt(deliveryData) {
  try {
    

   
    const exchangeRate = await getUSDtoUAH();

    async function delivery(deliveryData) {
      const price = await axios({
        method: "post",
        url: "https://dev.ukrposhta.ua/ecom/0.0.1/international/delivery-price",
        headers: {
          Authorization: `Bearer ${process.env.UKR_POSTA_BEARER}`,
          "Content-Type": "application/json",
        },
        data: {
          bulky: false,
          byCourier: true,
          currencyCode: "USD",
          currencyExchangeRate: exchangeRate,
          deliveryPrice: deliveryData.price,
          weight: deliveryData.weight,
          length: 25,
          packageType: "SMALL_BAG",
          recipientCountryIso3166: deliveryData.country,
          transportType: "GROUND",
          withDeliveryNotification: true,
        },
      });
      return price.data;
    }
    const devP = await delivery(deliveryData);
    return Math.ceil(devP.deliveryPrice);
  } catch (error) {
    const errorMsg = `Delivery price Int calculation is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
