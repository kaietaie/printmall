// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-nocheck
import React from 'react';
import PayPalCheckoutButton from '../components/PayPalCheckoutButton/PayPalCheckoutButton';
import ReturnButton from '../components/common/Buttons/ReturnButton';

interface Producto {
  description: string;
  price: number;
  sku: string;
}

const CheckoutPage = () => {
  const cart: Producto = {
    description: 'product',
    price: 10,
    sku: '1-106-1-2',
  };
  return (
    <>
      <ReturnButton />
      <PayPalCheckoutButton product={cart} />
    </>
  );
};

export default CheckoutPage;
