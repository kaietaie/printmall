import { createAsyncThunk } from '@reduxjs/toolkit';
import { capturePayPalOrder } from '../../api/paymentApi';
import { PaymentDetails } from '../../types/Payment';

export const capturePayPalOrderThunk = createAsyncThunk<PaymentDetails, string>(
  'payment/createPayPalOrder',
  async (props) => {
    return await capturePayPalOrder(props);
  }
);
