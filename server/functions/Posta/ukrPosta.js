import axios from "axios";
import logger from "../../logger/logger.js";
import downloadNovaPoshtaOffices from "./novaPostaAPI.js";

export default async function ukrposhtaDeliveryPriceInternational(req, res) {
  try {
    const { cart } = req.body;
    let subtotal = 0;
    cart.forEach((el) => {
      subtotal += el.price;
    });

    const deliveryData = {
      counrty: req.body.counrty,
      price: subtotal,
      weight: cart.length * 200,
    };
    async function getUSDtoUAH() {
      const response = await axios(
        "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json&valcode=USD&date=" +
          new Date().toISOString().slice(0, 10).replace(/-/g, "")
      );

      return response.data[0].rate;
    }
    const exchangeRate = await getUSDtoUAH();
    console.log({ exchangeRate });

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
          recipientCountryIso3166: deliveryData.counrty,
          transportType: "GROUND",
          withDeliveryNotification: true,
        },
      });
      return price.data;
    }
    const devP = await delivery(deliveryData);

    console.log(devP);
    downloadNovaPoshtaOffices("Київ")
    return res.json(Math.ceil(devP.deliveryPrice));
  } catch (error) {
    console.error(error);
    const errorMsg = `UkrPost Inter delivery price is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send({ Error: error.message });
  }
}

// EUR = {
//   deliveryPrice: 276.42,
//   rawDeliveryPrice: 266.42,
//   calculationDescription: `Price=6.93EUR(276.42UAH): destination country=DE; delivery type=GROUND;
//   price=2.88EUR; notification=1.50EUR; courier=2.30EUR; with_vat=266.42-50.00+(50.00+50.00*20.0%)`,
// };

// USD = {
//   deliveryPrice: 254.28,
//   rawDeliveryPrice: 244.28,
//   calculationDescription: `Price=6.95USD(254.28UAH): destination country=DE; delivery type=GROUND;
// price=2.88USD; notification=1.50USD; courier=2.30USD; with_vat=244.28-50.00+(50.00+50.00*20.0%)`,
// };
