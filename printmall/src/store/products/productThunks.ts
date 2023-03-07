import { createAsyncThunk } from '@reduxjs/toolkit';
import { fetchProducts } from '../../api/productAPI';
import { FetchProductsParams, Product } from '../../types/Products';

export const fetchProductsThunk = createAsyncThunk<
  Product[],
  FetchProductsParams
>('products/fetchProducts', async (props) => {
  return await fetchProducts(props);
});
