import { createAsyncThunk } from '@reduxjs/toolkit';
import { captureOrder } from '../../api/paymentApi';
import { captureOrderThunkProps, PaymentDetails } from '../../types/Payment';

export const captureOrderThunk = createAsyncThunk<
  PaymentDetails,
  captureOrderThunkProps
>('payment/captureOrder', async ({ orderId, type }) => {
  return await captureOrder({ orderId, type });
});
