import { Product } from '../types/Products';
import { products } from '../mochs/mProducts';

export const fetchProducts = async (): Promise<Product[]> => {
  try {
    // const response = await axios.get('/products', {});
    return products;
  } catch (error) {
    throw new Error('Failed to fetch products');
  }
};