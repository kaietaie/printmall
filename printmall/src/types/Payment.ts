export interface PaymentDetailsProduct {
  title: string;
  value: number;
  quantity: number;
}

export interface PaymentDetails {
  products: PaymentDetailsProduct[];
  date: string;
  order_number: number;
  taxes: number;
  total: number;
  payment_method: string;
  status: string;
}

export interface PaymentState {
  paymentDetails: PaymentDetails | null;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}
