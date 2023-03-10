import { ReactComponent as ArrowRightIcon } from '../../images/arrow_back.svg';
import { useNavigate } from 'react-router-dom';
const ReturnButton = () => {
  const navigate = useNavigate();

  const handleReturnClick = () => {
    navigate(-1);
  };
  return (
    <button onClick={handleReturnClick} className="return-button">
      <ArrowRightIcon />
      Back
    </button>
  );
};
export default ReturnButton;
