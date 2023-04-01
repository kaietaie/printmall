import axios from 'axios';

import {
  MakeMonobankPaymentResponse,
  PaymentData,
  PaymentDetails,
} from '../types/Payment';

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

export const capturePayPalOrder = async (
  orderID: string
): Promise<PaymentDetails> => {
  try {
    const response = await axios.post(
      'http://localhost:5000/payment/capture-paypal-order',
      {
        orderID,
      }
    );
    console.log(response);
    return response.data.data;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to capture PayPal order');
  }
};

// const mockMonobankData = {
//   cart: [
//     {
//       sku: '1-106-2-2',
//       quantity: 2,
//     },
//     {
//       sku: '1-80-2-3',
//       quantity: 1,
//     },
//   ],
//   shippingInfo: {
//     address: {
//       address_line_1: 'Ružinovská 1',
//       admin_area_2: 'Bratislava',
//       admin_area_1: 'Slovenská Republika',
//       postal_code: '821 01',
//       country_code: 'SK',
//     },
//     payer: {
//       name: { given_name: 'John', surname: 'Doe' },
//       email_address: 'kaieta.ievgenii@gmail.com',
//     },
//     phone: '+380689901426',
//   },
// };

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

export const getMonobankOrderDetails = async (
  orderId: string
): Promise<PaymentDetails> => {
  try {
    const response = await axios.post(
      'http://localhost:5000/paymentmono/check-mono-payment',
      { orderId }
    );

    return response.data;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to get monobank order details');
  }
};
