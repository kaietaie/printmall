import React from 'react';
import './PurchaseStatus.sass';
import squish from '../../../Helpers/ClassNameHelper';

interface StepClassNameProps {
  currentStep: 'cart' | 'payment' | 'complete';
}

const PurchaseStatus: React.FC<StepClassNameProps> = ({ currentStep }) => {
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
          Cart total
        </span>
        <span
          className={squish`
            purchase-status-page-name
            ${getStepClassName('payment')}
          `}
        >
          Payment
        </span>
        <span
          className={squish`
            purchase-status-page-name
            ${getStepClassName('complete')}
          `}
        >
          Complete
        </span>
      </div>
    </div>
  );
};

export default PurchaseStatus;
