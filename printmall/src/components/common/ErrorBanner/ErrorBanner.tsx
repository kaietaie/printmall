import { ReactComponent as ArrowForward } from '../../images/arrow_forward.svg';
import errorImage from '../../images/fail_banner.png';
import Button from '../Buttons';
import { useNavigate } from 'react-router-dom';

import './ErrorBanner.sass';

const ErrorBanner = () => {
  const navigate = useNavigate();

  const handleButtonClick = () => {
    navigate(`/seller/Go_A`);
  };

  return (
    <div className="error-banner">
      <h1 className="error-banner-title">Oops!</h1>
      <span className="error-banner-message">Something went wrong!</span>
      <img className="error-banner-image" src={errorImage} alt="error" />
      <Button
        onClick={handleButtonClick}
        iconEnd={<ArrowForward />}
        type="quaternary"
      >
        Back to seller page
      </Button>
    </div>
  );
};

export default ErrorBanner;
