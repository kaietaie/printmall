import { RootState } from '../store';

export const selectPayPalPaymentStatus = (state: RootState) => {
  if (state.payment.paymentDetails) {
    return state.payment.paymentDetails.status;
  }
  return '';
};
