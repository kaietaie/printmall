import PayPalCheckoutButton from "../components/PayPalCheckoutButton/PayPalCheckoutButton";
interface Producto {
  description: string,
  price: number
}

const CheckoutPage = () => {
  const cart: Producto= { description: 'product', price: 10 };
  return <PayPalCheckoutButton product={cart} />;
};

export default CheckoutPage;
