import { configureStore } from '@reduxjs/toolkit';
// import thunkMiddleware from 'redux-thunk';
import rootReducer from './rootReducer';
import { fetchProductsAsync } from './products/productThunk';
// import { fetchProductsAsync } from './products/productsSlice';

const store = configureStore({
  reducer: rootReducer,
  // middleware: [thunkMiddleware],
});

store.dispatch(fetchProductsAsync());

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;

export default store;
