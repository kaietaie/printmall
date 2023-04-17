import logger from "../../logger/logger.js";
import axios from "axios";
import getUSDtoUAH from "./getExchange.js";
import escapeHtml from "../escapeHTML.js";

const url = "https://dev.ukrposhta.ua/ecom/0.0.1";

export async function deliveryPriceInt(deliveryData) {
  try {
    const exchangeRate = await getUSDtoUAH();

    const price = await axios({
      method: "post",
      url: url + "/international/delivery-price",
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
    const { country, city, zip, region, address_line_1, address_line_2 } =
      deliveryData;
    const street = escapeHtml(address_line_1 + " " + address_line_2);

    const price = await axios({
      method: "post",
      url: url + "/addresses",
      headers: {
        Authorization: `Bearer ${process.env.UKR_POSTA_BEARER}`,
        "Content-Type": "application/json",
      },
      data: {
        country: country,
        city: city,
        postcode: `${zip}`,
        region: region,
        foreignStreetHouseApartment: street,
      },
    });
    const response = price.id;
    return response;
  } catch (error) {
    const errorMsg = `Add international address UKR post is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}
export async function getAddress(id) {
  try {
    const address = await axios({
      method: "get",
      url: url + "/addresses",
      headers: {
        Authorization: `Bearer ${process.env.UKR_POSTA_BEARER}`,
        "Content-Type": "application/json",
      },
      params: { id },
    });
    return address;
  } catch (error) {
    const errorMsg = `Get address UKR post is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}

export async function makeClient(client) {
  try {
    const {deliveryData} = client 
    const addressId = await addAddress(deliveryData)
    const address = await axios({
      method: "post", 
      url: url + "/clients",
      headers: {
        Authorization: `Bearer ${process.env.UKR_POSTA_BEARER}`,
        "Content-Type": "application/json",
      },
      data: {
        firstName: "Олександр",
        lastName: "Петренко",
        addressId: addressId,
        phoneNumber: 380672217743,
        type: "INDIVIDUAL",
      },
    });
    return address;
  } catch (error) {
    const errorMsg = `Get address UKR post is failed: ${error.message}`;
    logger.error(errorMsg);
  }
}

/*
{
	"id": 5253578,
	"postcode": "00-001",
	"region": "Warsaw",
	"district": null,
	"city": "Warsaw",
	"street": null,
	"houseNumber": null,
	"apartmentNumber": null,
	"description": null,
	"countryside": false,
	"posteRestante": false,
	"foreignStreetHouseApartment": "Warsawska 56, app 45",
	"detailedInfo": "Польща, 00-001, Warsaw, Warsaw, Warsawska 56, app 45",
	"created": "2023-04-17T13:49:49",
	"lastModified": "2023-04-17T13:49:49",
	"country": "PL"
}
{
	"id": 5253730,
	"postcode": "07541",
	"region": "Київська",
	"district": null,
	"city": "Березань",
	"street": "вул. Шевченків шлях",
	"houseNumber": "112",
	"apartmentNumber": "10",
	"description": null,
	"countryside": true,
	"posteRestante": false,
	"foreignStreetHouseApartment": null,
	"detailedInfo": "Україна, 07541, Київська, Березань, вул. Шевченків шлях 112, 10",
	"created": "2023-04-17T15:09:28",
	"lastModified": "2023-04-17T15:09:28",
	"country": "UA"
}
*/
