import axios from "axios";
import logger from "../../logger/logger.js";

export default async function deliveryPriceNP(cart, address) {
  try {
    const apiKey = process.env.NOVA_POSTA_KEY;
    const apiUrl = "https://api.novaposhta.ua/v2.0/json/";
console.log({address})
    async function delivery(address) {
      return await axios.post(apiUrl, {
        apiKey: apiKey,
        modelName: "InternetDocument",
        calledMethod: "getDocumentPrice",
        methodProperties: {
          CitySender: "e718a680-4b33-11e4-ab6d-005056801329",
          CityRecipient: address.city,
          Weight: "0.3",
          ServiceType: "WarehouseWarehouse",
          Cost: "300",
          CargoType: "Cargo",
          SeatsAmount: "1",
        },
      });
    }
    const response = await delivery(address)
    const price = response.data.data[0].Cost
    return price
  } catch(error) {
    const errorMsg = `Delivery price NP calculation is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
