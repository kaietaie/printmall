import { memo } from 'react';
import SendEmailInput from './SendEmailInput';
import { useTranslation } from 'react-i18next';

const ExclusiveOffers = () => {
  const { t } = useTranslation();

  return (
    <div className="exclusive-offers">
      <h3 className="exclusive-offers-title">
        {t('getExclusiveOffers.title')}
      </h3>
      <SendEmailInput />
      <p className="exclusive-offers-message">
        {t('getExclusiveOffers.message')}
      </p>
    </div>
  );
};

export default memo(ExclusiveOffers);
