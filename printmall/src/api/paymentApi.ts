import axios from 'axios';
import {
  captureOrderThunkProps,
  MakeMonobankPaymentResponse,
  PaymentDetails,
} from '../types/Payment';
import { SkuCartItem } from '../types/Cart';
import { CAPTURE_PAYMENT_URLS } from './constants';
import { CheckoutFormValues } from '../types/Forms';

export const createPayPalOrder = async (
  skuCartItems: SkuCartItem[]
): Promise<string> => {
  try {
    const response = await axios.post<{ id: string }>(
      'http://localhost:5000/payment/create-paypal-order',
      skuCartItems
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
      `http://localhost:5000/${CAPTURE_PAYMENT_URLS[type]}`,
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
  skuCartItems: SkuCartItem[]
): Promise<MakeMonobankPaymentResponse> => {
  try {
    const response = await axios.post(
      'http://localhost:5000/paymentmono/create-mono-order',
      skuCartItems
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
  console.log(shippingInfo);
  try {
    const response = await axios.post(
      'http://localhost:5000/shipping/add',
      shippingInfo
    );

    return response.data;
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
