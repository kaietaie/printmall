import { memo } from 'react';
import workOnPageImage from '../components/images/working_on_page.png';
import ExclusiveOffers from '../components/Footer/ExclusiveOffers';
import { useTranslation } from 'react-i18next';

const TemporaryHomePage = () => {
  const { t } = useTranslation();
  return (
    <div className="temporary-home-page">
      <p className="temporary-home-page-message">
        {t('home.temporaryMessage')}
      </p>
      <img src={workOnPageImage} alt="Work on page" />
      <ExclusiveOffers />
    </div>
  );
};

export default memo(TemporaryHomePage);
