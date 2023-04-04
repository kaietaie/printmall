import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

const PrivacyPage = () => {
  const { t } = useTranslation();
  return (
    <div className="privacy-page">
      <h1 className="privacy-page-title">{t('privacy.title')}</h1>

      <p>{t('privacy.updateDate')}</p>
      <p>
        {t('privacy.introductionPrt1')}
        &nbsp;<Link to="www.kram.market">www.kram.market</Link>&nbsp;
        {t('privacy.introductionPrt2')}
      </p>

      <h3>{t('privacy.infoCollectionTitle')}</h3>
      <p>{t('privacy.infoCollection')}</p>

      <h3>{t('privacy.infoSharingTitle')}</h3>
      <p>{t('privacy.infoSharing')}</p>

      <h3>{t('privacy.cookiesTitle')}</h3>
      <p>{t('privacy.cookies')}</p>

      <h3>{t('privacy.securityTitle')}</h3>
      <p>{t('privacy.security')}</p>

      <h3>{t('privacy.changePolicyTitle')}</h3>
      <p>{t('privacy.changePolicy')}</p>
    </div>
  );
};

export default PrivacyPage;
