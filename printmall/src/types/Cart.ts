export interface CartProduct {
  product_id: number;
  sku_cart_product_id: string;
  product_name: string;
  product_price: number;
  quantity: number;
  product_image: string;
  product_size: string;
  product_color: string;
}

export interface CartState {
  items: CartProduct[];
  cartTotalQuantity: number;
  cartTotalAmount: number;
  clientToken: string | null;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}

export interface SkuCartItem {
  sku: string;
  quantity: number;
}
