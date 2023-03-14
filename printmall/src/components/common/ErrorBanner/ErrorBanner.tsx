import { ReactComponent as ArrowForward } from '../../images/arrow_forward.svg';
import errorImage from '../../images/fail_banner.png';
import Button from '../Buttons';
import { useNavigate } from 'react-router-dom';

import './ErrorBanner.sass';
import { useTranslation } from 'react-i18next';

const ErrorBanner = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();

  const handleButtonClick = () => {
    navigate(`/seller/Go_A`);
  };

  return (
    <div className="error-banner">
      <h1 className="error-banner-title">{t('errorBanner.title')}</h1>
      <span className="error-banner-message">{t('errorBanner.message')}</span>
      <img className="error-banner-image" src={errorImage} alt="error" />
      <Button
        onClick={handleButtonClick}
        iconEnd={<ArrowForward />}
        type="quaternary"
      >
        {t('errorBanner.button')}
      </Button>
    </div>
  );
};

export default ErrorBanner;
