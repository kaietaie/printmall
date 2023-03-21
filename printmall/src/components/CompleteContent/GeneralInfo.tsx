import { memo } from 'react';

const GeneralInfo = () => {
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
        <span className="general-info-item-title">Order number:</span>
        <span className="general-info-item-value">{data.order_number}</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">Date :</span>
        <span className="general-info-item-value">{data.date}</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">Total :</span>
        <span className="general-info-item-value">{data.total}</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">Payment method:</span>
        <span className="general-info-item-value">{data.payment_method}</span>
      </div>
    </div>
  );
};

export default memo(GeneralInfo);
