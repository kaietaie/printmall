import { combineReducers } from '@reduxjs/toolkit';
import productsReducer from './products/productsSlice';
import productReducer from './products/productSlice';
import sellerReducer from './seller/sellerSlice';
import cartReducer from './cart/cartSlice';
import paymentSlice from './payment/paymentSlice';

const rootReducer = combineReducers({
  products: productsReducer,
  product: productReducer,
  seller: sellerReducer,
  cart: cartReducer,
  payment: paymentSlice,
});

export default rootReducer;
