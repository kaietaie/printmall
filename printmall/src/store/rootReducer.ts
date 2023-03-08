import { combineReducers } from '@reduxjs/toolkit';
import productsReducer from './products/productsSlice';
import productReducer from './products/productSlice';

const rootReducer = combineReducers({
  products: productsReducer,
  product: productReducer,
});

export default rootReducer;
