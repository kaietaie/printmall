export interface ShippingState {
  shippingPrice: string;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}

export interface SelectedOptionType {
  value: string;
  label: string;
}
