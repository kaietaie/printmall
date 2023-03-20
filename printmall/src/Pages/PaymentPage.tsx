// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-nocheck
import React, { useEffect } from 'react';
import PayPalCheckoutButton from '../components/PayPalCheckoutButton/PayPalCheckoutButton';
import ReturnButton from '../components/common/Buttons/ReturnButton';
import OrderDetails from '../components/OrderDetails';
import PaymentOptions from '../components/PaymentOptions/PaymentOptions';

const PaymentPage = () => {
  useEffect(() => {
    document.body.classList.add('purchasing-page');

    return () => {
      document.body.classList.remove('purchasing-page');
    };
  }, []);

  return (
    <div className="payment-page">
      <ReturnButton />
      <div className="payment-page-content">
        <PaymentOptions />
        <OrderDetails />
      </div>
    </div>
  );
};

export default PaymentPage;
