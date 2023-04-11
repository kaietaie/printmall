import { RootState } from '../store';

export const selectShippingPrice = (state: RootState) =>
  state.shipping.shippingPrice;
