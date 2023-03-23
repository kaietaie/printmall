// Interface for cart state
import { CartProduct, CartState } from '../../types/Cart';
import { createSlice, PayloadAction } from '@reduxjs/toolkit';

// Get the cart items from local storage, if any, and set it as initial cart items
const storedCartItems = localStorage.getItem('cartItems');
const initialCartItems =
  storedCartItems != null ? JSON.parse(storedCartItems) : [];

const initialState: CartState = {
  items: initialCartItems,
  cartTotalQuantity: 0,
  cartTotalAmount: 0,
  // clientToken: null,
  status: 'idle',
  error: null,
};

// Create a cart slice using Redux toolkit createSlice
const cartSlice = createSlice({
  name: 'cart',
  initialState,
  reducers: {
    // Add an item to the cart
    addItem: (state, action: PayloadAction<CartProduct>) => {
      const newItem = action.payload;
      const itemIndex = state.items.findIndex(
        (item) => item.sku_cart_product_id === newItem.sku_cart_product_id
      );
      if (itemIndex >= 0) {
        state.items[itemIndex].quantity += 1;
      } else {
        const tempProduct = { ...newItem, quantity: 1 };
        state.items.push(tempProduct);
      }
      localStorage.setItem('cartItems', JSON.stringify(state.items));
    },

    // Remove an item from the cart
    removeItem: (state, action) => {
      state.items = state.items.filter(
        (item) => item.sku_cart_product_id !== action.payload
      );
      localStorage.setItem('cartItems', JSON.stringify(state.items));
    },

    // Decrease the quantity of an item in the cart
    decreaseItem: (state, action) => {
      const itemIndex = state.items.findIndex(
        (item) => item.sku_cart_product_id === action.payload
      );
      if (state.items[itemIndex].quantity > 1) {
        state.items[itemIndex].quantity -= 1;
      } else if (state.items[itemIndex].quantity === 1) {
        state.items = state.items.filter(
          (item) => item.sku_cart_product_id !== action.payload
        );
      }
      localStorage.setItem('cartItems', JSON.stringify(state.items));
    },

    // Clear the cart
    clearCart: (state) => {
      state.items = [];
      state.cartTotalQuantity = 0;
      localStorage.setItem('cartItems', JSON.stringify(state.items));
    },

    // Get the total cost and quantity of all items in the cart
    getTotals: (state) => {
      const { total, quantity } = state.items.reduce(
        (cartTotal, item) => {
          const { product_price, quantity } = item;
          const itemTotal = product_price * quantity;

          cartTotal.total += itemTotal;
          cartTotal.quantity += quantity;

          return cartTotal;
        },
        {
          total: 0 as number,
          quantity: 0 as number,
        }
      );

      state.cartTotalQuantity = quantity;
      state.cartTotalAmount = total;
    },
  },

  //todo Implementation for tracking not purchased carts

  // extraReducers: (builder) => {
  //   builder
  //     .addCase(createOrder.pending, (state) => {
  //       state.status = 'loading';
  //     })
  //     .addCase(createOrder.fulfilled, (state, action) => {
  //       state.clientToken = action.payload.client_token;
  //       state.status = 'succeeded';
  //       state.error = null;
  //     })
  //     .addCase(createOrder.rejected, (state, action) => {
  //       state.status = 'failed';
  //       state.error = action.payload ?? 'Error creating order';
  //     });
  // },
});

export const { addItem, removeItem, decreaseItem, clearCart, getTotals } =
  cartSlice.actions;

export default cartSlice.reducer;
