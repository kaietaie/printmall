import minoIcon from '../images/monobank-icon.jpeg';
import { makeMonobankPayment } from '../../api/paymentApi';
import { useSelector } from 'react-redux';
import { selectMonobankPaymentData } from '../../store/payment/paymentSelectors';
import { RootState } from '../../store/store';
import { MonobankData } from '../../types/Payment';

const MonobankButton = () => {
  const monobankData = useSelector<RootState, MonobankData>(
    selectMonobankPaymentData
  );

  const handleClick = async () => {
    try {
      window.location.href = await makeMonobankPayment(monobankData);
      // dispatch(clearShippingInfo);
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <button onClick={handleClick} className="monobank-button">
      <img src={minoIcon} alt="icon" />
    </button>
  );
};

export default MonobankButton;
