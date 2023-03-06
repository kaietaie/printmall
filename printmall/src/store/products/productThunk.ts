import { createAsyncThunk } from '@reduxjs/toolkit';
import { products } from '../../mochs/mProducts';
// import { fetchProducts } from '../../api/productAPI';

export const fetchProductsAsync = createAsyncThunk(
  'products/fetchProducts',
  async () => {
    // const response = await fetchProducts();
    const response = products;
    return response;
  }
);
