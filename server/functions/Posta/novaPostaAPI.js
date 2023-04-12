import axios from "axios";
import fs from "fs";
import logger from "../../logger/logger.js";
const apiUrl = "https://api.novaposhta.ua/v2.0/json/";

// const CityRecipient = "";

// const getCities = (string) => {
//   const query = {
//     apiKey: process.env.NOVA_POSTA_KEY,
//     modelName: "Address",
//     calledMethod: "getCities",
//     methodProperties: {
//       FindByString: string || "",
//     },
//   };

//   return data.Ref
// };

// const getWarehouses = {
//   apiKey: process.env.NOVA_POSTA_KEY,
//   modelName: "Address",
//   calledMethod: "getWarehouses",
//   methodProperties: {
//     CityName: "Київ",
//     CityRef: "CityRef",
//     Page: "1",
//     Limit: "50",
//     Language: "UA",
//     TypeOfWarehouseRef: "00000000-0000-0000-0000-000000000000",
//     WarehouseId: "151",
//   },
// };

// const getDocumentPrice = {
//   apiKey: process.env.NOVA_POSTA_KEY,
//   modelName: "InternetDocument",
//   calledMethod: "getDocumentPrice",
//   methodProperties: {
//     CitySender: "00000000-0000-0000-0000-000000000000",
//     CityRecipient: CityRecipient,
//     Weight: "0.1",
//     ServiceType: "WarehouseWarehouse",
//     Cost: "300",
//     CargoType: "Cargo",
//     SeatsAmount: "2",
//     RedeliveryCalculate: {
//       CargoType: "Money",
//       Amount: "100",
//     },
//     PackCount: "1",
//     PackRef: "00000000-0000-0000-0000-000000000000",
//     Amount: "100",
//     CargoDetails: [
//       {
//         CargoDescription: "00000000-0000-0000-0000-000000000000",
//         Amount: "2",
//       },
//     ],
//     CargoDescription: "00000000-0000-0000-0000-000000000000",
//   },
// };

// Функція, яка завантажує список відділень Нової Пошти в обраному місті

export default async function downloadNovaPoshtaOffices(cityName) {
  const apiKey = process.env.NOVA_POSTA_KEY
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
      modelName: "AddressGeneral",
      calledMethod: "getWarehouses",
      methodProperties: {
        CityRef: cityRef,
        Limit: 50,
        Page: 1
      },
      apiKey: apiKey,
    });

    const offices = officesResponse.data.data.map((office) => {
      return {
        label: office.Description,
        value: office.Description,
      };
    });

    const fileName = `${cityName}_offices.json`;
    console.log(offices)
    fs.writeFileSync(fileName, JSON.stringify(offices, null, 2));
    console.log(`File ${fileName} saved!`);
  } catch (error) {
    console.error(error);
    const errorMsg = `NovaPosta get warehouses is failed: ${error.message}`;
    logger.error(errorMsg);
    res.status(500).send({ Error: error.message });
  }
}

// // Функція, яка запускає завантаження відділень раз на день о 10:00
// function runDailyDownload() {
//   // Встановлюємо час, коли має бути запущена функція
//   const downloadTime = new Date();
//   downloadTime.setHours(10, 0, 0, 0);

//   // Встановлюємо інтервал між запусками в 24 години
//   const interval = 24 * 60 * 60 * 1000;

//   // Обчислюємо час, який залишився до ближчого запуску
//   let timeUntilDownload = downloadTime.getTime() - new Date().getTime();

//   // Якщо час до запуску вже пройшов, то запускаємо функцію відразу
//   if (timeUntilDownload <= 0) {
//     timeUntilDownload += interval;
//   }

//   // Запускаємо функцію раз на день о 10
//   setTimeout(() => {
//     // Викликаємо функцію downloadNovaPoshtaOffices з необхідними параметрами
//     const cityName = "Київ";
//     const apiKey = "YOUR_API_KEY";
//     downloadNovaPoshtaOffices(cityName, apiKey);
//     // Запускаємо функцію ще раз через 24 години
//     runDailyDownload();
//   }, timeUntilDownload);
// }

// // Запускаємо функцію runDailyDownload
// runDailyDownload();
