import axios from 'axios';
import { FetchProductsParams, Product } from '../types/Products';
// import { products } from '../mochs/mProducts';

export const fetchProducts = async (
  props: FetchProductsParams
): Promise<Product[]> => {
  try {
    const response = await axios.get(
      `http://localhost:5000/products${
        props ? `?limit=${props.limit}&page=${props.page}` : ''
      }`
    );

    // console.log(response.data);
    //
    // return products;

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

    // console.log(response.data);

    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch products');
  }
};
