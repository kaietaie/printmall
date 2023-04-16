import axios from "axios";

export default async function getUSDtoUAH() {
    const response = await axios(
      "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json&valcode=USD&date=" +
        new Date().toISOString().slice(0, 10).replace(/-/g, "")
    );

    return response.data[0].rate;
  }