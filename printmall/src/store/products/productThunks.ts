import { createAsyncThunk } from '@reduxjs/toolkit';
import { fetchProductById, fetchProducts } from '../../api/productAPI';
import { FetchProductsParams } from '../../types/Products';
import { Product } from '../../types/Product';

export const fetchProductsThunk = createAsyncThunk<
  Product[],
  FetchProductsParams | undefined
>('products/fetchProducts', async (props = undefined) => {
  return await fetchProducts(props);
});

export const fetchProductByIdThunk = createAsyncThunk<Product, number>(
  'product/fetchProductById',
  async (id: number) => {
    return await fetchProductById(id);
  }
);
