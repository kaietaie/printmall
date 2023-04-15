import { RootState } from '../store';

export const selectCartTotalQuantity = (state: RootState) =>
  state.cart.cartTotalQuantity;

export const selectCartItems = (state: RootState) => state.cart.items;

export const selectSkuCartItems = (state: RootState) => {
  return state.cart.items.map((item) => {
    return {
      sku: item.sku_cart_product_id,
      quantity: item.quantity,
      name: item.product_name,
      price: item.product_price,
      id: item.product_id,
    };
  });
};

export const selectCartTotalAmount = (state: RootState) =>
  state.cart.cartTotalAmount;

// export const selectClientToken = (state: RootState) => state.cart.clientToken;
