import { RootState } from '../store';
import { createSelector } from '@reduxjs/toolkit';
import { selectScuCartItems } from '../cart/cartSelectors';
import { MonobankData } from '../../types/Payment';

export const selectPayPalPaymentStatus = (state: RootState) => {
  if (state.payment.paymentDetails) {
    return state.payment.paymentDetails.status;
  }
  return '';
};

export const selectPayPalPaymentDetails = (state: RootState) =>
  state.payment.paymentDetails;

export const selectShippingInfo = (state: RootState) =>
  state.payment.shippingInfo;

export const selectMonobankPaymentData = createSelector(
  [selectScuCartItems, selectShippingInfo],
  (scuCartItems, shippingInfo): MonobankData => {
    return {
      cart: scuCartItems,
      shippingInfo: shippingInfo,
    };
  }
);

export const selectOrderId = (state: RootState) => state.payment.orderId;
