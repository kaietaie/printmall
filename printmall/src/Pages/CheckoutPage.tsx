// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-nocheck
import PayPalCheckoutButton from "../components/PayPalCheckoutButton/PayPalCheckoutButton";
interface Producto {
  description: string,
  price: number
  sku: string
}

const CheckoutPage = () => {
  const cart: Producto= { description: 'product', price: 10, sku: '1-106-1-2' };
  return <PayPalCheckoutButton product={cart} />;
};

export default CheckoutPage;
