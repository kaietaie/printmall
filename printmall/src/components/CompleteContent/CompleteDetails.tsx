import Button from '../common/Buttons';
import { useTranslation } from 'react-i18next';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import { useNavigate } from 'react-router-dom';

const CompleteDetails = () => {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const order_details = [
    { title: 'Custom Printed T-Shirt', value: '230', quantity: 1 },
    { title: 'Taxes:', value: '10' },
    { title: 'Shipping:', value: '10' },
    { title: 'Payment method:', value: 'PayPal' },
    { title: 'Total:', value: '250' },
  ];

  const handleButtonClick = () => {
    navigate(`/seller/Go_A`);
  };

  return (
    <div>
      <h2 className="complete-details-title">Order details</h2>
      <table className="complete-details-table">
        <thead>
          <tr>
            <th>Product</th>
            <th>Total</th>
          </tr>
        </thead>
        <tbody>
          {order_details.map((item, index) => (
            <tr key={index}>
              <td>
                {item.title}
                {item?.quantity && <span>{` x ${item.quantity}`}</span>}
              </td>
              <td>
                {!(item.title === 'Payment method:') && '$'}
                {item.value}
              </td>
            </tr>
          ))}
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

export default CompleteDetails;
