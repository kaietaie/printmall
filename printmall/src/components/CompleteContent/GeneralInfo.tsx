import { memo } from 'react';
import { useTranslation } from 'react-i18next';

const GeneralInfo = () => {
  const { t } = useTranslation();

  const data = {
    products: [
      { title: 'Custom Printed T-Shirt', value: '230', quantity: 1 },
      { title: 'Ocean View Tee', value: '240', quantity: 1 },
    ],
    taxes: 10,
    shipping: 10,
    payment_method: 'PayPal',
    total: 500,
    date: 123423413,
    order_number: 234,
  };

  return (
    <div className="general-info">
      <div className="general-info-item">
        <span className="general-info-item-title">
          {t('complete.orderNumber')}
        </span>
        <span className="general-info-item-value">{data.order_number}</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">{t('complete.date')}</span>
        <span className="general-info-item-value">{data.date}</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">{t('complete.total')}</span>
        <span className="general-info-item-value">${data.total}</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">
          {t('complete.paymentMethod')}
        </span>
        <span className="general-info-item-value">{data.payment_method}</span>
      </div>
    </div>
  );
};

export default memo(GeneralInfo);
