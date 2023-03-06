import { createSlice } from '@reduxjs/toolkit';
import { Product } from '../../types/Products';
import { fetchProductsAsync } from './productThunk';
// import { fetchProducts } from './productAPI';

interface ProductsState {
  items: Product[];
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}

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
      .addCase(fetchProductsAsync.pending, (state) => {
        state.status = 'loading';
      })
      // Action to be dispatched when the products have been successfully fetched
      .addCase(fetchProductsAsync.fulfilled, (state, action) => {
        state.items = action.payload;
        state.status = 'succeeded';
        state.error = null;
      })
      // Action to be dispatched when the products fetching fails
      .addCase(fetchProductsAsync.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message ?? 'Error fetching products';
      });
  },
});

export const productsActions = {
  ...productsSlice.actions,
  // fetchProductsAsync,
};

export default productsSlice.reducer;
