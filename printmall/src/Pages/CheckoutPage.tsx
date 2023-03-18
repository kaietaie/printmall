// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-nocheck
import React from 'react';
import PayPalCheckoutButton from '../components/PayPalCheckoutButton/PayPalCheckoutButton';
import ReturnButton from '../components/common/Buttons/ReturnButton';

interface Producto {
  sku: string;
  quantity: number
}

const CheckoutPage = () => {
  // cart треба зробити щоб підтягувався з реальної корзини. з цими полями що я вказав.
  const cart: Producto = {
    sku: "1-106-1-2",
    quantity: 1,
  };
  return (
    <>
      <ReturnButton />
      <PayPalCheckoutButton product={cart} />
    </>
  );
};

export default CheckoutPage;
