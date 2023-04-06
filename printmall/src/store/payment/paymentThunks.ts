import { createAsyncThunk } from '@reduxjs/toolkit';
import { capturePayPalOrder } from '../../api/paymentApi';
import { captureOrderThunkProps, PaymentDetails } from '../../types/Payment';

export const capturePayPalOrderThunk = createAsyncThunk<
  PaymentDetails,
  captureOrderThunkProps
>('payment/createPayPalOrder', async ({ orderId, type }) => {
  return await capturePayPalOrder({ orderId, type });
});
