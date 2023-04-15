import { createAsyncThunk } from '@reduxjs/toolkit';
import { CheckoutFormValues } from '../../types/Forms';
import { sendShippingInfo } from '../../api/paymentApi';
import { SkuCartItem } from '../../types/Cart';

export const sendShippingInfoThunk = createAsyncThunk<
  string,
  { shippingInfo: CheckoutFormValues; scuCartItems: SkuCartItem[] }
>('shipping/sendShippingInfo', async ({ shippingInfo, scuCartItems }) => {
  return await sendShippingInfo(shippingInfo, scuCartItems);
});
