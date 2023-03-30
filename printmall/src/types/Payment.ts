import { CheckoutFormValues } from './Forms';
import { SkuCartItem } from './Cart';

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
  shippingInfo: CheckoutFormValues;
  paymentDetails: PaymentDetails | null;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}

export interface MonobankData {
  cart: SkuCartItem[];
  shippingInfo: CheckoutFormValues;
}
