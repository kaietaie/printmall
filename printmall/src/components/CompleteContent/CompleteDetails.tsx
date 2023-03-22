import { memo } from 'react';
import Button from '../common/Buttons';
import { useTranslation } from 'react-i18next';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import { useNavigate } from 'react-router-dom';

const CompleteDetails = () => {
  const { t } = useTranslation();
  const navigate = useNavigate();

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

  const handleButtonClick = () => {
    navigate(`/seller/Go_A`);
  };

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
          {data.products.map((item, index) => (
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
            <td>${data.taxes}</td>
          </tr>
          <tr>
            <td>{t('complete.shipping')}</td>
            <td>${data.shipping}</td>
          </tr>
          <tr>
            <td>{t('complete.paymentMethod')}</td>
            <td>{data.payment_method}</td>
          </tr>
          <tr>
            <td>{t('complete.total')}</td>
            <td>${data.total}</td>
          </tr>
        </tbody>
      </table>
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

export default memo(CompleteDetails);