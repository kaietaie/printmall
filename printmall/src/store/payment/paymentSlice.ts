import { createSlice } from '@reduxjs/toolkit';
import { PaymentState } from '../../types/Payment';
import { capturePayPalOrderThunk } from './paymentThunks';

const initialState: PaymentState = {
  paymentDetails: null,
  status: 'idle',
  error: null,
};

const paymentSlice = createSlice({
  name: 'payment',
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(capturePayPalOrderThunk.pending, (state) => {
        state.status = 'loading';
      })
      .addCase(capturePayPalOrderThunk.fulfilled, (state, action) => {
        state.paymentDetails = action.payload;
        state.status = 'succeeded';
        state.error = null;
      })
      .addCase(capturePayPalOrderThunk.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message ?? 'Error fetching product';
      });
  },
});

export default paymentSlice.reducer;
