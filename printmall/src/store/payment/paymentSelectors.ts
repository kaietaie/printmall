import { RootState } from '../store';

export const selectPayPalPaymentStatus = (state: RootState) => {
  if (state.payment.paymentDetails) {
    return state.payment.paymentDetails.status;
  }
  return '';
};

export const selectPayPalPaymentDetails = (state: RootState) =>
  state.payment.paymentDetails;

export const selectOrderId = (state: RootState) => state.payment.orderId;

export const selectOrderCaptureStatus = (state: RootState) =>
  state.payment.status;
