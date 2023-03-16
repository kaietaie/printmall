import { Product } from './Product';

export interface FetchProductsParams {
  limit?: number;
  page?: number;
}

export interface ProductsState {
  items: Product[];
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}
