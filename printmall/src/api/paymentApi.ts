import axios from 'axios';
import { SkuCartItem } from '../types/Cart';

export const createPayPalOrder = async (
  cartItems: SkuCartItem[]
): Promise<string> => {
  try {
    const response = await axios.post<{ id: string }>(
      'http://localhost:5000/payment/create-paypal-order',
      {
        cart: cartItems,
      }
    );

    return response.data.id;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to create PayPal order');
  }
};

export const capturePayPalOrder = async (orderID: string): Promise<any> => {
  try {
    const response = await axios.post(
      'http://localhost:5000/payment/capture-paypal-order',
      {
        orderID,
      }
    );

    return response.data;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to capture PayPal order');
  }
};
