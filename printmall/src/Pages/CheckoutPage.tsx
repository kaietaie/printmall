// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-nocheck
import React from 'react';
import PayPalCheckoutButton from '../components/PayPalCheckoutButton/PayPalCheckoutButton';
import ReturnButton from '../components/common/Buttons/ReturnButton';

const CheckoutPage = () => {
  return (
    <>
      <ReturnButton />
      <PayPalCheckoutButton />
    </>
  );
};

export default CheckoutPage;
