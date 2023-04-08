import { useEffect } from 'react';
import ReturnButton from '../components/common/Buttons/ReturnButton';
import CheckoutForm from '../components/common/Forms/CheckoutForm';
import PurchaseStatus from '../components/common/PurchaseStatus';
import OrderDetails from '../components/common/OrderDetails';
import { useSelector } from 'react-redux';
import { RootState } from '../store/store';
import { CartState } from '../types/Cart';
import { selectCartTotalQuantity } from '../store/cart/cartSelectors';
import { useNavigate } from 'react-router-dom';

import './Pages.sass';

const CheckoutPage = () => {
  const navigate = useNavigate();
  const cartTotalQuantity = useSelector<
    RootState,
    CartState['cartTotalQuantity']
  >(selectCartTotalQuantity);

  useEffect(() => {
    if (cartTotalQuantity === 0) {
      navigate(`/seller/Go_A`);
    }

    document.body.classList.add('purchasing-page');

    return () => {
      document.body.classList.remove('purchasing-page');
    };
  }, [cartTotalQuantity, navigate]);

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

export default CheckoutPage;
