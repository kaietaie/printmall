import { RootState } from '../store';

export const selectCartTotalQuantity = (state: RootState) =>
  state.cart.cartTotalQuantity;

export const selectCartItems = (state: RootState) => state.cart.items;

export const selectPayPalCartItems = (state: RootState) => {
  return state.cart.items.map((item) => {
    return {
      sku: item.sku_cart_product_id,
      quantity: item.quantity,
    };
  });
};

export const selectCartTotalAmount = (state: RootState) =>
  state.cart.cartTotalAmount;

// export const selectClientToken = (state: RootState) => state.cart.clientToken;
