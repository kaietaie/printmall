export interface Color {
  color: string;
  product_image: string;
}

export interface Product {
  product_id: number;
  product_name: string;
  colors: Color[];
  seller_name: string;
  product_description: string;
  seller_sales: number;
  product_price: number;
  seller_rating: number;
  size_color: {
    [key: string]: string[];
  };
  sizes: string[];
}

export interface ProductState {
  product: Product | null;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}
