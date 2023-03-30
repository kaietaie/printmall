import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { PaymentState } from '../../types/Payment';
import { capturePayPalOrderThunk } from './paymentThunks';
import { CheckoutFormValues } from '../../types/Forms';

const initialState: PaymentState = {
  shippingInfo: null,
  paymentDetails: null,
  status: 'idle',
  error: null,
};

const paymentSlice = createSlice({
  name: 'payment',
  initialState,
  reducers: {
    addShippingInfo: (state, action: PayloadAction<CheckoutFormValues>) => {
      state.shippingInfo = action.payload;
    },
    clearPaymentDetails: (state) => {
      state.paymentDetails = null;
    },
  },
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

export const { clearPaymentDetails, addShippingInfo } = paymentSlice.actions;

export default paymentSlice.reducer;
