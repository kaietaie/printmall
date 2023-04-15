import { createSlice } from '@reduxjs/toolkit';
import { sendShippingInfoThunk } from './shippingThunks';
import { ShippingState } from '../../types/Shipping';

const storedShippingPrice = localStorage.getItem('shippingPrice');
const initialShippingPrice =
  storedShippingPrice != null ? JSON.parse(storedShippingPrice) : '';

const initialState: ShippingState = {
  shippingPrice: initialShippingPrice,
  status: 'idle',
  error: null,
};

const shippingSlice = createSlice({
  name: 'shipping',
  initialState,
  reducers: {
    clearShippingPrice: (state) => {
      state.shippingPrice = '';
      localStorage.setItem(
        'shippingPrice',
        JSON.stringify(state.shippingPrice)
      );
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(sendShippingInfoThunk.pending, (state) => {
        state.status = 'loading';
      })
      .addCase(sendShippingInfoThunk.fulfilled, (state, action) => {
        state.shippingPrice = action.payload;
        state.status = 'succeeded';
        state.error = null;

        localStorage.setItem(
          'shippingPrice',
          JSON.stringify(state.shippingPrice)
        );
      })
      .addCase(sendShippingInfoThunk.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message ?? 'Failed to send shipping info';
      });
  },
});

export const { clearShippingPrice } = shippingSlice.actions;

export default shippingSlice.reducer;
