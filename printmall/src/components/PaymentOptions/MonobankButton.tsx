import minoIcon from '../images/monobank-icon.jpeg';
import { makeMonobankPayment } from '../../api/paymentApi';
import { useDispatch, useSelector } from 'react-redux';
import { selectPaymentData } from '../../store/payment/paymentSelectors';
import { AppDispatch, RootState } from '../../store/store';
import { PaymentData } from '../../types/Payment';
import { setOrderId } from '../../store/payment/paymentSlice';

const MonobankButton = () => {
  const dispatch = useDispatch<AppDispatch>();
  const monobankData = useSelector<RootState, PaymentData>(selectPaymentData);

  const handleClick = async () => {
    try {
      // window.location.href = await makeMonobankPayment(monobankData);
      const { url, orderId } = await makeMonobankPayment(monobankData);
      dispatch(setOrderId(orderId));
      window.location.href = url;
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
