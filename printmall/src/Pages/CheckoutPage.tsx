import ReturnButton from '../components/common/Buttons/ReturnButton';
import CheckoutForm from '../components/common/Forms/CheckoutForm';
import PurchaseStatus from '../components/common/PurchaseStatus';

import './Pages.sass';

const CheckoutPage = () => {
  return (
    <div className="checkout-page">
      <ReturnButton />
      <PurchaseStatus currentStep="payment" />
      <div className="checkout-page-content">
        <CheckoutForm />
      </div>
    </div>
  );
};

export default CheckoutPage;
