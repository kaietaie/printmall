export interface Color {
  color: string;
  product_image: string;
}

export interface Product {
  product_id: number;
  product_name: string;
  colors: Color[];
  seller_name: string;
  seller_sales: number;
  product_price: number;
  seller_rating: number;
}

export interface FetchProductsParams {
  limit?: number;
  page?: number;
}
