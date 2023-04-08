import PurchaseStatus from '../components/common/PurchaseStatus';
import CompleteContent from '../components/CompleteContent';
import { useEffect, useRef } from 'react';
import { clearCart } from '../store/cart/cartSlice';
import { clearPaymentInfo } from '../store/payment/paymentSlice';
import { useDispatch } from 'react-redux';
import { AppDispatch } from '../store/store';

const CompletePage = () => {
  const dispatch = useDispatch<AppDispatch>();
  const isFirstRender = useRef(true);

  useEffect(() => {
    if (isFirstRender.current) {
      isFirstRender.current = false;
      return;
    }

    dispatch(clearCart());

    return () => {
      dispatch(clearPaymentInfo());
    };
  }, [dispatch]);

  return (
    <div className="complete-page">
      <PurchaseStatus currentStep="complete" />
      <CompleteContent />
    </div>
  );
};

export default CompletePage;
