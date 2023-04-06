import axios from 'axios';
import {
  captureOrderThunkProps,
  MakeMonobankPaymentResponse,
  PaymentData,
  PaymentDetails,
} from '../types/Payment';
import { CAPTURE_PAYMENT_URLS } from './constants';

export const createPayPalOrder = async (
  PaymentData: PaymentData
): Promise<string> => {
  try {
    const response = await axios.post<{ id: string }>(
      'http://localhost:5000/payment/create-paypal-order',
      PaymentData
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
  PaymentData: PaymentData
): Promise<MakeMonobankPaymentResponse> => {
  try {
    const response = await axios.post(
      'http://localhost:5000/paymentmono/create-mono-order',
      PaymentData
    );

    return response.data;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to make monobank payment');
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
