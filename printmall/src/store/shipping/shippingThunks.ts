import { createAsyncThunk } from '@reduxjs/toolkit';
import { CheckoutFormValues } from '../../types/Forms';
import { sendShippingInfo } from '../../api/paymentApi';

export const sendShippingInfoThunk = createAsyncThunk<
  string,
  CheckoutFormValues
>('shipping/sendShippingInfo', async (props) => {
  console.log(props);
  return await sendShippingInfo(props);
});
