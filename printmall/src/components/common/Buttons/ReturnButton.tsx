import { memo } from 'react';
import { ReactComponent as ArrowRightIcon } from '../../images/arrow_back.svg';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

const ReturnButton = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();

  const handleReturnClick = () => {
    navigate(-1);
  };

  return (
    <button onClick={handleReturnClick} className="return-button">
      <ArrowRightIcon />
      {t('common.returnButton')}
    </button>
  );
};

export default memo(ReturnButton);
