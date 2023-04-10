import React, { useEffect } from 'react';
import ReturnButton from '../components/common/Buttons/ReturnButton';
import OrderDetails from '../components/common/OrderDetails';
import PaymentOptions from '../components/PaymentOptions/PaymentOptions';
import PurchaseStatus from '../components/common/PurchaseStatus';
import ErrorBoundary from '../components/common/ErrorBoundary';

const PaymentPage = () => {
  useEffect(() => {
    document.body.classList.add('purchasing-page');

    return () => {
      document.body.classList.remove('purchasing-page');
    };
  }, []);

  return (
    <ErrorBoundary>
      <div className="payment-page">
        <ReturnButton />
        <PurchaseStatus currentStep="payment" />
        <div className="payment-page-content">
          <PaymentOptions />
          <OrderDetails />
        </div>
      </div>
    </ErrorBoundary>
  );
};

export default PaymentPage;
