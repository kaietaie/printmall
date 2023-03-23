import React from 'react';
import './PurchaseStatus.sass';
import squish from '../../../Helpers/ClassNameHelper';
import { useTranslation } from 'react-i18next';

interface StepClassNameProps {
  currentStep: 'cart' | 'payment' | 'complete';
}

const PurchaseStatus: React.FC<StepClassNameProps> = ({ currentStep }) => {
  const { t } = useTranslation();
  const getStepClassName = (step: StepClassNameProps['currentStep']) => {
    if (step === currentStep) {
      return 'active';
    }
    return '';
  };

  return (
    <div className="purchase-status">
      <div className="purchase-status-indicators">
        <div
          className={squish`
            purchase-status-indicator
            ${getStepClassName('cart')}
          `}
        ></div>
        <div className="purchase-status-line"></div>
        <div
          className={squish`
            purchase-status-indicator
            ${getStepClassName('payment')}
         `}
        ></div>
        <div className="purchase-status-line"></div>
        <div
          className={squish`
            purchase-status-indicator
            ${getStepClassName('complete')}
         `}
        ></div>
      </div>
      <div className="purchase-status-page-names">
        <span
          className={squish`
            purchase-status-page-name
            ${getStepClassName('cart')}
          `}
        >
          {t('purchaseStatus.cart')}
        </span>
        <span
          className={squish`
            purchase-status-page-name
            ${getStepClassName('payment')}
          `}
        >
          {t('purchaseStatus.payment')}
        </span>
        <span
          className={squish`
            purchase-status-page-name
            ${getStepClassName('complete')}
          `}
        >
          {t('purchaseStatus.complete')}
        </span>
      </div>
    </div>
  );
};

export default PurchaseStatus;
