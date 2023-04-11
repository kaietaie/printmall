import axios from 'axios';
import { Seller } from '../types/Sellers';
import { BACKEND_URL } from './constants';

export const fetchSellerByName = async (name: string): Promise<Seller> => {
  try {
    const response = await axios.get(
      `${BACKEND_URL}/seller${name ? `/${name}` : ''}`
    );

    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch products');
  }
};
