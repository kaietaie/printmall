import minoIcon from '../images/monobank-icon.jpeg';
import { makeMonobankPayment } from '../../api/paymentApi';
import { useDispatch } from 'react-redux';
import { AppDispatch } from '../../store/store';
import { setOrderId } from '../../store/payment/paymentSlice';

const MonobankButton = () => {
  const dispatch = useDispatch<AppDispatch>();

  const handleClick = async () => {
    try {
      const { url, orderId } = await makeMonobankPayment();
      dispatch(setOrderId(orderId));
      window.location.href = url;
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
