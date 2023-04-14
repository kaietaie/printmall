export interface ShippingState {
  shippingPrice: string;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}

export interface selectedOptionType {
  value: string;
  label: string;
}
