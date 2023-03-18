import { RootState } from '../store';

export const selectCartTotalQuantity = (state: RootState) =>
  state.cart.cartTotalQuantity;

export const selectCartItems = (state: RootState) => state.cart.items;

export const selectCartTotalAmount = (state: RootState) =>
  state.cart.cartTotalAmount;

export const selectClientToken = (state: RootState) => state.cart.clientToken;
