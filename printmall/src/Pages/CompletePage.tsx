import PurchaseStatus from '../components/common/PurchaseStatus';
import CompleteContent from '../components/CompleteContent';
import { useEffect, useRef } from 'react';
import { clearCart } from '../store/cart/cartSlice';
import { clearPaymentInfo } from '../store/payment/paymentSlice';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../store/store';
import { PaymentState } from '../types/Payment';
import { selectOrderCaptureStatus } from '../store/payment/paymentSelectors';
import { useNavigate } from 'react-router-dom';
import { clearShippingPrice } from '../store/shipping/shippingSlice';

const CompletePage = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch<AppDispatch>();
  const isFirstRender = useRef(true);
  const status = useSelector<RootState, PaymentState['status']>(
    selectOrderCaptureStatus
  );

  useEffect(() => {
    if (isFirstRender.current) {
      isFirstRender.current = false;
      return;
    }

    if (status !== 'succeeded') {
      navigate(`/seller/Go_A`);
      return;
    }

    dispatch(clearCart());
    dispatch(clearShippingPrice());

    return () => {
      dispatch(clearPaymentInfo());
      navigate('/seller/Go_A');
    };
  }, [dispatch, navigate, status]);

  return (
    <div className="complete-page">
      <PurchaseStatus currentStep="complete" />
      <CompleteContent />
    </div>
  );
};

export default CompletePage;
