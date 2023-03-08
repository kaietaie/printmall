import { createAsyncThunk } from '@reduxjs/toolkit';
import { fetchProductById, fetchProducts } from '../../api/productAPI';
import { FetchProductsParams, Product } from '../../types/Products';

export const fetchProductsThunk = createAsyncThunk<
  Product[],
  FetchProductsParams
>('products/fetchProducts', async (props) => {
  return await fetchProducts(props);
});

export const fetchProductByIdThunk = createAsyncThunk<Product, number>(
  'product/fetchProductById',
  async (id: number) => {
    const response = await fetchProductById(id);
    // console.log(response);

    return response;
  }
);
