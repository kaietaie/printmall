import axios from 'axios';
import { Product } from '../types/Products';

export const fetchProducts = async (): Promise<Product[]> => {
  try {
    const response = await axios.get('/products');
    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch products');
  }
};
