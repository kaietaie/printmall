import axios from 'axios';
import { FetchProductsParams } from '../types/Products';
import { Product } from '../types/Product';

export const fetchProducts = async (
  props: FetchProductsParams | undefined
): Promise<Product[]> => {
  try {
    const response = await axios.get(
      `http://localhost:5000/products${
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
      `http://localhost:5000/products${id ? `/${id}` : ''}`
    );

    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch products');
  }
};
