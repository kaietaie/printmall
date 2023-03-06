import { createAsyncThunk } from '@reduxjs/toolkit';
import { fetchProducts } from '../../api/productAPI';

export const fetchProductsAsync = createAsyncThunk(
  'products/fetchProducts',
  async () => {
    return await fetchProducts();
  }
);
