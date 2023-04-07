import { combineReducers } from '@reduxjs/toolkit';
import productsReducer from './products/productsSlice';
import productReducer from './products/productSlice';
import sellerReducer from './seller/sellerSlice';
import cartReducer from './cart/cartSlice';
import paymentSlice from './payment/paymentSlice';
import shippingSlice from './shipping/shippingSlice';

const rootReducer = combineReducers({
  products: productsReducer,
  product: productReducer,
  seller: sellerReducer,
  cart: cartReducer,
  payment: paymentSlice,
  shipping: shippingSlice,
});

export default rootReducer;
