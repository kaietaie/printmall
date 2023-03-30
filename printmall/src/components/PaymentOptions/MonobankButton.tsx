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
      const res = await makeMonobankPayment(monobankData);
      // window.location.href = await makeMonobankPayment(monobankData);
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
