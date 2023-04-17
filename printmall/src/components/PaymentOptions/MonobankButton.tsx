import minoIcon from '../images/monobank-icon.jpeg';
import { makeMonobankPayment } from '../../api/paymentApi';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../../store/store';
import { setOrderId } from '../../store/payment/paymentSlice';
import { selectSkuCartItems } from '../../store/cart/cartSelectors';
import { SkuCartItem } from '../../types/Cart';

const MonobankButton = () => {
  const dispatch = useDispatch<AppDispatch>();
  const scuCartItems = useSelector<RootState, SkuCartItem[]>(
    selectSkuCartItems
  );

  const handleClick = async () => {
    try {
      const { url, orderId } = await makeMonobankPayment(scuCartItems);
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
