const CityRecipient = "";

const request = {
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
