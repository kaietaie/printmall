import axios from 'axios';
import { SkuCartItem } from '../types/Cart';

export const sendSkus = async (skus: SkuCartItem[]) => {
  try {
    console.log(skus);
    const response = await axios.post(
      'http://localhost:5000/payment/checkout',
      { skus }
    );// responce token
    console.log(response.data)
    return response.data;
  } catch (error: any) {
    throw error.response.data;
  }
};
