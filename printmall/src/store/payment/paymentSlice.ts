import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { PaymentState } from '../../types/Payment';
import { captureOrderThunk } from './paymentThunks';
import { CheckoutFormValues } from '../../types/Forms';

const initialShippingInfoValues = {
  first_name: '',
  last_name: '',
  email: '',
  phone: '',
  address_line_1: '',
  address_line_2: '',
  country: '',
  city: '',
  region: '',
  zip_code: '',
};

const storedOrderId = localStorage.getItem('orderId');
const storedSippingInfo = localStorage.getItem('shippingInfo');

const initialShippingInfo =
  storedSippingInfo != null
    ? JSON.parse(storedSippingInfo)
    : initialShippingInfoValues;

const initialOrderId = storedOrderId != null ? JSON.parse(storedOrderId) : null;

const initialState: PaymentState = {
  orderId: initialOrderId,
  shippingInfo: initialShippingInfo,
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
    addShippingInfo: (state, action: PayloadAction<CheckoutFormValues>) => {
      state.shippingInfo = action.payload;
      localStorage.setItem('shippingInfo', JSON.stringify(state.shippingInfo));
    },
    clearPaymentInfo: (state) => {
      state.paymentDetails = null;
      state.shippingInfo = initialShippingInfoValues;
      state.orderId = null;
      localStorage.setItem('orderId', JSON.stringify(state.orderId));
      localStorage.setItem('shippingInfo', JSON.stringify(state.shippingInfo));
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

export const { clearPaymentInfo, addShippingInfo, setOrderId } =
  paymentSlice.actions;

export default paymentSlice.reducer;
