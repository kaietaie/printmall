import minoIcon from '../images/monobank-icon.jpeg';
import { makeMonobankPayment } from '../../api/paymentApi';

const MonobankButton = () => {
  const handleClick = async () => {
    try {
      window.location.href = await makeMonobankPayment();
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
