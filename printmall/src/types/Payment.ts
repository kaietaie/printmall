import { CheckoutFormValues } from './Forms';

export interface PaymentDetailsProduct {
  title: string;
  value: number;
  quantity: number;
}

export interface PaymentDetails {
  products: PaymentDetailsProduct[];
  date: string;
  order_number: number;
  shipping: number;
  taxes: number;
  total: number;
  payment_method: string;
  status: string;
}

export interface PaymentState {
  shippingInfo: CheckoutFormValues | null;
  paymentDetails: PaymentDetails | null;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}
