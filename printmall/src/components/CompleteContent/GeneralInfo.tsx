import React, { memo } from 'react';
import { useTranslation } from 'react-i18next';

interface GeneralInfoProps {
  date: string;
  total: number;
  payment_method: string;
  order_number: number;
}

const GeneralInfo: React.FC<GeneralInfoProps> = ({
  date,
  total,
  payment_method,
  order_number,
}) => {
  const { t } = useTranslation();

  const dateObj = new Date(date);
  const formattedDate = dateObj.toLocaleDateString('en-GB');

  return (
    <div className="general-info">
      <div className="general-info-item">
        <span className="general-info-item-title">
          {t('complete.orderNumber')}
        </span>
        <span className="general-info-item-value">{order_number}</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">{t('complete.date')}</span>
        <span className="general-info-item-value">{formattedDate}</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">{t('complete.total')}</span>
        <span className="general-info-item-value">${total}</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">
          {t('complete.paymentMethod')}
        </span>
        <span className="general-info-item-value">{payment_method}</span>
      </div>
    </div>
  );
};

export default memo(GeneralInfo);
