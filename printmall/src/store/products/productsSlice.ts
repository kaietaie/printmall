import { createSlice } from '@reduxjs/toolkit';
import { ProductsState } from '../../types/Products';
import { fetchProductsThunk } from './productThunks';
// import { fetchProducts } from './productAPI';

const initialState: ProductsState = {
  items: [],
  status: 'idle',
  error: null,
};

// Define the products slice with reducers
const productsSlice = createSlice({
  name: 'products',
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder
      // Action to be dispatched when the products are being fetched
      .addCase(fetchProductsThunk.pending, (state) => {
        state.status = 'loading';
      })
      // Action to be dispatched when the products have been successfully fetched
      .addCase(fetchProductsThunk.fulfilled, (state, action) => {
        state.items = action.payload;
        state.status = 'succeeded';
        state.error = null;
      })
      // Action to be dispatched when the products fetching fails
      .addCase(fetchProductsThunk.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message ?? 'Error fetching products';
      });
  },
});

export const productsActions = {
  ...productsSlice.actions,
  // fetchProductsThunk,
};

export default productsSlice.reducer;
