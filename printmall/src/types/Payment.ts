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
  orderId: string | null;
  paymentDetails: PaymentDetails | null;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}

export interface MakeMonobankPaymentResponse {
  url: string;
  orderId: string;
}

export interface captureOrderThunkProps {
  orderId: string;
  type: 'payPal' | 'monobank';
}
