import axios from 'axios';
import { Product } from '../types/Products';
import { products } from '../mochs/mProducts';

export const fetchProducts = async (): Promise<Product[]> => {
  try {
    const response = await axios.get('http://localhost:5000/products', {data: {
      "limit":2, "page": 1
      }});
      console.log(response)
    // return products;
    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch products');
  }
};
