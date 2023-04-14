import axios from 'axios';
import { NOVA_POST_URL } from './constants';

interface CityOption {
  label: string;
  value: string;
}

interface ApiResponse {
  success: boolean;
  data: any;
}
export const getNovaPostCities = async (
  cityName: string
): Promise<CityOption[]> => {
  const apiKey = process.env.REACT_APP_NOVA_POSTA_KEY;
  try {
    const response = await axios.post<ApiResponse>(NOVA_POST_URL, {
      modelName: 'Address',
      calledMethod: 'searchSettlements',
      methodProperties: {
        CityName: cityName,
        Limit: 10,
      },
      apiKey: apiKey,
    });
    return response.data.data[0].Addresses.map((city: any) => ({
      label: city.Present,
      value: city.DeliveryCity,
    }));
  } catch (error) {
    console.error(error);
    throw new Error('Failed to get cities.');
  }
};

export const getNovaPostWarehouses = async (
  cityRef: string,
  warehouseInputValue: string
): Promise<CityOption[]> => {
  const apiKey = process.env.REACT_APP_NOVA_POSTA_KEY;
  try {
    const response = await axios.post(NOVA_POST_URL, {
      modelName: 'AddressGeneral',
      calledMethod: 'getWarehouses',
      methodProperties: {
        CityRef: cityRef,
        Limit: 50,
        FindByString: warehouseInputValue,
      },
      apiKey: apiKey,
    });

    return response.data.data.map((warehouse: any) => ({
      label: warehouse.Description,
      value: warehouse.Ref,
    }));
  } catch (error) {
    console.error(error);
    throw new Error('Failed to get warehouses.');
  }
};
