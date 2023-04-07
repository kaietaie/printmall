export interface ShippingState {
  shippingPrice: string;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}
