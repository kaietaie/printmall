import { combineReducers } from '@reduxjs/toolkit';
import productsReducer from './products/productsSlice';
import productReducer from './products/productSlice';
import sellerReducer from './seller/sellerSlice';

const rootReducer = combineReducers({
  products: productsReducer,
  product: productReducer,
  seller: sellerReducer,
});

export default rootReducer;
