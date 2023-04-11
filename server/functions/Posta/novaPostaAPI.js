const apiUrl = "https://api.novaposhta.ua/v2.0/json/"


const CityRecipient = "";

const getCities = (string) => {
  const query = {
    apiKey: process.env.NOVA_POSTA_KEY,
    modelName: "Address",
    calledMethod: "getCities",
    methodProperties: {
      FindByString: string || "",
    },
  };

  return data.Ref
};

const getWarehouses = {
  apiKey: process.env.NOVA_POSTA_KEY,
  modelName: "Address",
  calledMethod: "getWarehouses",
  methodProperties: {
    CityName: "Київ",
    CityRef: "CityRef",
    Page: "1",
    Limit: "50",
    Language: "UA",
    TypeOfWarehouseRef: "00000000-0000-0000-0000-000000000000",
    WarehouseId: "151",
  },
};

const getDocumentPrice = {
  apiKey: process.env.NOVA_POSTA_KEY,
  modelName: "InternetDocument",
  calledMethod: "getDocumentPrice",
  methodProperties: {
    CitySender: "00000000-0000-0000-0000-000000000000",
    CityRecipient: CityRecipient,
    Weight: "0.1",
    ServiceType: "WarehouseWarehouse",
    Cost: "300",
    CargoType: "Cargo",
    SeatsAmount: "2",
    RedeliveryCalculate: {
      CargoType: "Money",
      Amount: "100",
    },
    PackCount: "1",
    PackRef: "00000000-0000-0000-0000-000000000000",
    Amount: "100",
    CargoDetails: [
      {
        CargoDescription: "00000000-0000-0000-0000-000000000000",
        Amount: "2",
      },
    ],
    CargoDescription: "00000000-0000-0000-0000-000000000000",
  },
};
