import { combineReducers } from '@reduxjs/toolkit';
import productsReducer from './products/productsSlice';
import productReducer from './products/productSlice';
import sellerReducer from './seller/sellerSlice';
import cartReducer from './cart/cartSlice';

const rootReducer = combineReducers({
  products: productsReducer,
  product: productReducer,
  seller: sellerReducer,
  cart: cartReducer,
});

export default rootReducer;
