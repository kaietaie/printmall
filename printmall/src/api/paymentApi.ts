import axios from 'axios';
import {
  captureOrderThunkProps,
  MakeMonobankPaymentResponse,
  PaymentDetails,
} from '../types/Payment';
import { SkuCartItem } from '../types/Cart';
import { BACKEND_URL, CAPTURE_PAYMENT_URLS } from './constants';
import { CheckoutFormValues } from '../types/Forms';

export const createPayPalOrder = async (
  SkuCartItem: SkuCartItem[]
): Promise<string> => {
  try {
    const response = await axios.post<{ id: string }>(
      `${BACKEND_URL}/payment/create-paypal-order`,
      { cart: SkuCartItem }
    );

    return response.data.id;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to create PayPal order');
  }
};

export const captureOrder = async ({
  orderId,
  type,
}: captureOrderThunkProps): Promise<PaymentDetails> => {
  try {
    const response = await axios.post(
      `${BACKEND_URL}/${CAPTURE_PAYMENT_URLS[type]}`,
      { orderId }
    );

    return response.data;
  } catch (error) {
    console.error(error);
    // throw new Error('Failed to capture order');
    return Promise.reject(error);
  }
};

export const makeMonobankPayment = async (
  SkuCartItem: SkuCartItem[]
): Promise<MakeMonobankPaymentResponse> => {
  try {
    const response = await axios.post(
      `${BACKEND_URL}/paymentmono/create-mono-order`,
      { cart: SkuCartItem }
    );

    return response.data;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to make monobank payment');
  }
};

export const sendShippingInfo = async (
  shippingInfo: CheckoutFormValues
): Promise<string> => {
  const optimizedShippingInfo = {
    ...shippingInfo,
    warehouse: shippingInfo.warehouse?.value,
    city:
      typeof shippingInfo.city === 'string'
        ? shippingInfo.city
        : shippingInfo.city?.value,
  };

  try {
    const response = await axios.post(`${BACKEND_URL}/shipping/add`, {
      shippingInfo,
    });

    return response.data.shippingCost;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to create PayPal order');
  }
};

// export const getMonobankOrderDetails = async (
//   orderId: string
// ): Promise<PaymentDetails> => {
//   try {
//     const response = await axios.post(
//       'http://localhost:5000/paymentmono/check-mono-payment',
//       { orderId }
//     );
//     return response.data;
//   } catch (error) {
//     // console.error(error);
//     // throw new Error('Failed to get monobank order details');
//     return Promise.reject(error);
//   }
// };
