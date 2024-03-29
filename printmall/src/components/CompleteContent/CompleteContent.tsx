import React, { memo } from 'react';
import GeneralInfo from './GeneralInfo';
import CompleteDetails from './CompleteDetails';
import { useSelector } from 'react-redux';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import { RootState } from '../../store/store';
import { selectPayPalPaymentDetails } from '../../store/payment/paymentSelectors';
import { PaymentDetails } from '../../types/Payment';
import Button from '../common/Buttons';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import Loader from '../common/Loader';

import './CompleteContent.sass';

const CompleteContent = () => {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const paymentDetails = useSelector<RootState, PaymentDetails | null>(
    selectPayPalPaymentDetails
  );

  if (!paymentDetails) {
    return <Loader />;
  }

  const handleButtonClick = () => {
    navigate(`/seller/Go_A`);
  };

  return (
    <div className="complete-content">
      <div className="complete-content-gratitude">
        <span className="complete-content-gratitude-message">
          {t('complete.gratitudeBanner')}
        </span>
      </div>
      <>
        <GeneralInfo
          date={paymentDetails.date}
          order_number={paymentDetails.order_number}
          total={paymentDetails.total}
          payment_method={paymentDetails.payment_method}
        />
        <CompleteDetails
          payment_method={paymentDetails.payment_method}
          total={paymentDetails.total}
          products={paymentDetails.products}
          taxes={paymentDetails.taxes}
          shipping={paymentDetails.shipping}
        />
      </>
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
