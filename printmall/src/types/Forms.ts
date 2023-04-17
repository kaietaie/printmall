import { SelectedOptionType } from './Shipping';

export interface SupportFormValues {
  first_name: string;
  last_name: string;
  email: string;
  phone: string;
  message: string;
  lang: string;
}

export interface CheckoutFormValues {
  first_name: string;
  last_name: string;
  email: string;
  phone: string;
  address_line_1: string;
  address_line_2: string;
  country: string;
  city: SelectedOptionType;
  warehouse: SelectedOptionType;
  region: string;
  zip_code: string;
  shipping_method: string;
}
