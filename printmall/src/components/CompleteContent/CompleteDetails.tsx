import React, { memo } from 'react';
import { useTranslation } from 'react-i18next';
import { PaymentDetails } from '../../types/Payment';

type CompleteDetailsProps = Omit<
  PaymentDetails,
  'date' | 'status' | 'order_number'
>;

const CompleteDetails: React.FC<CompleteDetailsProps> = ({
  payment_method,
  total,
  taxes,
  products,
  shipping,
}) => {
  const { t } = useTranslation();

  return (
    <div>
      <h2 className="complete-details-title">{t('complete.detailsTitle')}</h2>
      <table className="complete-details-table">
        <thead>
          <tr>
            <th>{t('complete.product')}</th>
            <th>{t('complete.details')}</th>
          </tr>
        </thead>
        <tbody>
          {products.map((item, index) => (
            <tr key={index}>
              <td>
                {item.title}
                {` x ${item.quantity}`}
              </td>
              <td>${item.value}</td>
            </tr>
          ))}

          <tr>
            <td>{t('complete.taxes')}</td>
            <td>${taxes}</td>
          </tr>
          <tr>
            <td>{t('complete.shipping')}</td>
            <td>${shipping}</td>
          </tr>
          <tr>
            <td>{t('complete.paymentMethod')}</td>
            <td>{payment_method}</td>
          </tr>
          <tr>
            <td>{t('complete.total')}</td>
            <td>${total}</td>
          </tr>
        </tbody>
      </table>
    </div>
  );
};

export default memo(CompleteDetails);
