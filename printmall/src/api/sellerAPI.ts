import axios from 'axios';
import { Seller } from '../types/Sellers';

export const fetchSellerByName = async (name: string): Promise<Seller> => {
  try {
    const response = await axios.get(
      `http://localhost:5000/seller${name ? `/${name}` : ''}`
    );

    // console.log(response.data);

    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch products');
  }
};
