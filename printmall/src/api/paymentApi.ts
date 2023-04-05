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

    return response.data.data;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to capture PayPal order');
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
    // console.error(error);
    // throw new Error('Failed to get monobank order details');
    return Promise.reject(error);
  }
};
