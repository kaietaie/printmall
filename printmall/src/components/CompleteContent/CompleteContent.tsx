import React, { memo, useEffect } from 'react';
import GeneralInfo from './GeneralInfo';
import CompleteDetails from './CompleteDetails';
import { useDispatch, useSelector } from 'react-redux';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import { AppDispatch, RootState } from '../../store/store';
import {
  selectOrderId,
  selectPayPalPaymentDetails,
} from '../../store/payment/paymentSelectors';
import { PaymentDetails } from '../../types/Payment';
import Button from '../common/Buttons';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { clearPaymentDetails } from '../../store/payment/paymentSlice';
import { getMonobankOrderDetails } from '../../api/paymentApi';

import './CompleteContent.sass';

const CompleteContent = () => {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const dispatch = useDispatch<AppDispatch>();
  const orderDetails = useSelector<RootState, PaymentDetails | null>(
    selectPayPalPaymentDetails
  );
  const orderId = useSelector(selectOrderId);

  useEffect(() => {
    const fetchMonobankOrderDetails = async () => {
      if (orderId) {
        return await getMonobankOrderDetails(orderId);
      }
    };
    const res = fetchMonobankOrderDetails();
    console.log(res);
  }, [orderId]);

  const handleButtonClick = () => {
    dispatch(clearPaymentDetails());
    navigate(`/seller/Go_A`);
  };

  return (
    <div className="complete-content">
      <div className="complete-content-gratitude">
        <span className="complete-content-gratitude-message">
          {t('complete.gratitudeBanner')}
        </span>
      </div>
      {orderDetails && (
        <>
          <GeneralInfo
            date={orderDetails.date}
            order_number={orderDetails.order_number}
            total={orderDetails.total}
            payment_method={orderDetails.payment_method}
          />
          <CompleteDetails
            payment_method={orderDetails.payment_method}
            total={orderDetails.total}
            products={orderDetails.products}
            taxes={orderDetails.taxes}
            shipping={orderDetails.shipping}
          />
        </>
      )}
      <Button
        className="complete-details-button"
        onClick={handleButtonClick}
        iconEnd={<ArrowForward />}
        type="secondary"
      >
        {t('common.backToHomeButton')}
      </Button>
    </div>
  );
};

export default memo(CompleteContent);
