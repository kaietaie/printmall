import { createSlice } from '@reduxjs/toolkit';
import { sendShippingInfoThunk } from './shippingThunks';
import { ShippingState } from '../../types/Shipping';

const initialState: ShippingState = {
  shippingPrice: '',
  status: 'idle',
  error: null,
};

const shippingSlice = createSlice({
  name: 'shipping',
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(sendShippingInfoThunk.pending, (state) => {
        state.status = 'loading';
      })
      .addCase(sendShippingInfoThunk.fulfilled, (state, action) => {
        state.shippingPrice = action.payload;
        state.status = 'succeeded';
        state.error = null;
      })
      .addCase(sendShippingInfoThunk.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message ?? 'Failed to send shipping info';
      });
  },
});

export default shippingSlice.reducer;
