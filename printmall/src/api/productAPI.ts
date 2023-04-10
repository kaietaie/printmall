import axios from 'axios';
import { FetchProductsParams } from '../types/Products';
import { Product } from '../types/Product';
import { BACKEND_URL } from './constants';

export const fetchProducts = async (
  props: FetchProductsParams | undefined
): Promise<Product[]> => {
  try {
    const response = await axios.get(
      `${BACKEND_URL}/products${
        props ? `?limit=${props.limit}&page=${props.page}` : ''
      }`
    );

    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch products');
  }
};
export const fetchProductById = async (id: number): Promise<Product> => {
  try {
    const response = await axios.get(
      `${BACKEND_URL}/products${id ? `/${id}` : ''}`
    );

    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch products');
  }
};
