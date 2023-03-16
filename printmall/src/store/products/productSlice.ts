import { createSlice } from '@reduxjs/toolkit';
import { fetchProductByIdThunk } from './productThunks';
import { ProductState } from '../../types/Product';

const initialState: ProductState = {
  product: null,
  status: 'idle',
  error: null,
};

const productSlice = createSlice({
  name: 'product',
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchProductByIdThunk.pending, (state) => {
        state.status = 'loading';
      })
      .addCase(fetchProductByIdThunk.fulfilled, (state, action) => {
        state.product = action.payload;
        state.status = 'succeeded';
        state.error = null;
      })
      .addCase(fetchProductByIdThunk.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message ?? 'Error fetching product';
      });
  },
});

// export const selectProductById =
//   (productId: number) => (state: { product: ProductState }) =>
//     state.product.product && state.product.product.product_id === productId
//       ? state.product.product
//       : null;

export default productSlice.reducer;
