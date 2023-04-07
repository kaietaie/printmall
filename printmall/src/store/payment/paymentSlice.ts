import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { PaymentState } from '../../types/Payment';
import { captureOrderThunk } from './paymentThunks';

const storedOrderId = localStorage.getItem('orderId');
const initialOrderId = storedOrderId != null ? JSON.parse(storedOrderId) : null;

const initialState: PaymentState = {
  orderId: initialOrderId,
  paymentDetails: null,
  status: 'idle',
  error: null,
};

const paymentSlice = createSlice({
  name: 'payment',
  initialState,
  reducers: {
    setOrderId: (state, action: PayloadAction<string>) => {
      state.orderId = action.payload;
      localStorage.setItem('orderId', JSON.stringify(state.orderId));
    },
    clearPaymentInfo: (state) => {
      state.paymentDetails = null;
      state.orderId = null;
      localStorage.setItem('orderId', JSON.stringify(state.orderId));
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(captureOrderThunk.pending, (state) => {
        state.status = 'loading';
      })
      .addCase(captureOrderThunk.fulfilled, (state, action) => {
        state.paymentDetails = action.payload;
        state.status = 'succeeded';
        state.error = null;
      })
      .addCase(captureOrderThunk.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message ?? 'Failed to create order';
      });
  },
});

export const { clearPaymentInfo, setOrderId } = paymentSlice.actions;

export default paymentSlice.reducer;
