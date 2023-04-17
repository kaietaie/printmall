import logger from "../../logger/logger.js";
import axios from "axios";
import getUSDtoUAH from "./getExchange.js";

const url =  "https://dev.ukrposhta.ua/ecom/0.0.1"

export async function deliveryPriceInt(deliveryData) {
  try {
    const exchangeRate = await getUSDtoUAH();

      const price = await axios({
        method: "post",
        url: url +"/international/delivery-price",
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
    
  
    return Math.ceil(price.data.deliveryPrice);
  } catch (error) {
    const errorMsg = `Delivery price Int calculation is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}

export async function addAddress(deliveryData) {
  try {
    async function delivery(deliveryData) {
      const price = await axios({
        method: "post",
        url: url + "/addresses",
        headers: {
          Authorization: `Bearer ${process.env.UKR_POSTA_BEARER}`,
          "Content-Type": "application/json",
        },
        data: {
          postcode: 12345,
          country: "UA",
          region: "Київська",
          city: "Бровари",
          istrict: "Київський",
          street: "Котляревського",
          houseNumber: 12,
          apartmentNumber: 33,
        },
      });
    }
  } catch (error) {
    const errorMsg = `Delivery price Int calculation is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
