import { memo } from 'react';
import ReturnButton from '../components/common/Buttons/ReturnButton';
import CheckoutForm from '../components/common/Forms/CheckoutForm';
import PurchaseStatus from '../components/common/PurchaseStatus';
import OrderDetails from '../components/common/OrderDetails';

import './Pages.sass';

const CheckoutPage = () => {
  return (
    <div className="checkout-page">
      <ReturnButton />
      <PurchaseStatus currentStep="checkout" />
      <div className="checkout-page-content">
        <CheckoutForm />
        <OrderDetails />
      </div>
    </div>
  );
};

export default memo(CheckoutPage);
