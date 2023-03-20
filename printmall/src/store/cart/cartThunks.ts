import { createAsyncThunk } from '@reduxjs/toolkit';
import { sendSkus } from '../../api/cartApi';
import { SkuCartItem } from '../../types/Cart';
interface SendSkusResponseType {
  client_token: string;
}

export const createOrder = createAsyncThunk<
  SendSkusResponseType,
  SkuCartItem[],
  { rejectValue: string }
>('cart/createOrder', async (skus, thunkAPI) => {
  try {
    return await sendSkus(skus);
  } catch (error: any) {
    return thunkAPI.rejectWithValue(error?.response.data);
  }
});
