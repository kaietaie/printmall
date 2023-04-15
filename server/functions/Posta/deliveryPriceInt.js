import logger from "../../logger/logger.js";
import axios from "axios";

export default async function deliveryPriceInt(cart, country) {
  try {
    let subtotal = 0,
      qty = 0;
    cart.forEach((el) => {
      subtotal += el.price;
      qty += el.quantity;
    });
    console.log(qty);
    const deliveryData = {
      country: country,
      price: subtotal,
      weight: qty * 200,
    };

    async function getUSDtoUAH() {
      const response = await axios(
        "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json&valcode=USD&date=" +
          new Date().toISOString().slice(0, 10).replace(/-/g, "")
      );

      return response.data[0].rate;
    }
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
