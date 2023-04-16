import axios from "axios";
import logger from "../../logger/logger.js";
const apiUrl = "https://api.novaposhta.ua/v2.0/json/";
const apiKey = process.env.NOVA_POSTA_KEY;

// Функція, яка завантажує список відділень Нової Пошти в обраному місті

export async function downloadNovaPoshtaOffices(req, res) {
  const { cityName } = req.body;
  try {
    const response = await axios.post(apiUrl, {
      modelName: "Address",
      calledMethod: "searchSettlements",
      methodProperties: {
        CityName: cityName,
        Limit: 1,
      },
      apiKey: apiKey,
    });

    const cityRef = response.data.data[0].Ref;

    const officesResponse = await axios.post(apiUrl, {
      apiKey: apiKey,
      modelName: "AddressGeneral",
      calledMethod: "getWarehouses",
      methodProperties: {
        CityRef: cityRef,
        Limit: 50,
        Page: 1,
      },
    });

    const offices = officesResponse.data.data.map((office) => {
      return {
        label: office.Description,
        value: office.Description,
      };
    });
    return res.json(offices);
  } catch (error) {
    console.error(error);
    const errorMsg = `NovaPosta get warehouses is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send({ Error: error.message });
  }
}

export async function deliveryPriceNP(deliveryData) {
  try {
    const cityKyiv = "e718a680-4b33-11e4-ab6d-005056801329";

    async function delivery(deliveryData) {
      return await axios.post(apiUrl, {
        apiKey: apiKey,
        modelName: "InternetDocument",
        calledMethod: "getDocumentPrice",
        methodProperties: {
          CitySender: cityKyiv,
          CityRecipient: deliveryData.city,
          Weight: `${deliveryData.weight / 1000}`,
          ServiceType: "WarehouseWarehouse",
          Cost: `${deliveryData.price}`,
          CargoType: "Cargo",
          SeatsAmount: "1",
        },
      });
    }
    const response = await delivery(deliveryData);
    const price = response.data.data[0].Cost;
    return price;
  } catch (error) {
    const errorMsg = `Delivery price NP calculation is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}

export async function saveEHNP(deliveryData) {
  try {
    const cityKyiv = "e718a680-4b33-11e4-ab6d-005056801329";

    async function delivery(deliveryData) {
      return await axios.post(apiUrl, {
        apiKey: apiKey,
        modelName: "InternetDocument",
        calledMethod: "save",
        methodProperties: {
          SenderWarehouseIndex: "101/102",
          RecipientWarehouseIndex: "101/102",
          PaymentMethod: "NonCash",
          CargoType: "Parcel",
          VolumeGeneral: "0.45", // Загальний об'єм, м.куб (min - 0.0004)
          Weight: "0.5",
          ServiceType: "WarehouseWarehouse",
          Description: "Замовлення з магазину Kram Market",
          Cost: "15000", // Оціночна вартість
          CitySender: "00000000-0000-0000-0000-000000000000", // Ідентифікатор міста відправника
          Sender: "00000000-0000-0000-0000-000000000000", //Ідентифікатор відправника
          SenderAddress: "00000000-0000-0000-0000-000000000000", // Ідентифікатор адреси відправника. REF адреси брати з відповіді методу Список адрес контрагента
          ContactSender: "00000000-0000-0000-0000-000000000000", // Ідентифікатор контактної особи відправника. REF брати з відповіді методу Список контактних осіб контрагента
          SendersPhone: "380660000000", // Телефон відправника у форматі: +380660000000,
          CityRecipient: "00000000-0000-0000-0000-000000000000",
          Recipient: "00000000-0000-0000-0000-000000000000",
          RecipientAddress: "00000000-0000-0000-0000-000000000000",
          ContactRecipient: "00000000-0000-0000-0000-000000000000",
          RecipientsPhone: "380660000000",
        },
      });
    }
    const response = await delivery(deliveryData);
    const price = response.data.data[0].Cost;
    return price;
  } catch (error) {
    const errorMsg = `Delivery price NP calculation is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}

export async function getCounterpartiesNP(deliveryData) {
  try {
    async function delivery(deliveryData) {
      return await axios.post(apiUrl, {
        apiKey: apiKey,
        modelName: "Counterparty",
        calledMethod: "getCounterparties",
        methodProperties: {
          CounterpartyProperty: "Sender",
        },
      });
    }
    const response = await delivery(deliveryData);
    const price = response.data.data[0].Cost;
    return price;
  } catch (error) {
    const errorMsg = `Delivery price NP calculation is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
