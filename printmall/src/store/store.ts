import { configureStore } from '@reduxjs/toolkit';
import rootReducer from './rootReducer';
import { getTotals } from './cart/cartSlice';
// import { fetchProductByIdThunk } from './products/productThunks';

const store = configureStore({
  reducer: rootReducer,
  // middleware: [thunkMiddleware],
});

// store.dispatch(fetchProductByIdThunk(1));
store.dispatch(getTotals());

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;

export default store;
