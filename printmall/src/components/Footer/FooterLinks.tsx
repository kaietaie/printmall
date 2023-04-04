import { useTranslation } from 'react-i18next';
import { memo, useState } from 'react';
import SupportModal from '../common/SupportModal/SupportModal';
import { Link } from 'react-router-dom';

const FooterLinks = () => {
  const { t } = useTranslation();
  const [isOpenModal, setOpenIsModal] = useState(false);

  const handleToggleModal = () => {
    setOpenIsModal(!isOpenModal);
  };

  return (
    <div className="footer-links">
      <h3 className="footer-links-title">{t('footer.linksTitle')}</h3>
      <div className="footer-links-container">
        <div className="footer-links-column">
          <button onClick={handleToggleModal} className="footer-links-item">
            {t('footer.contactUs')}
          </button>
          <span className="footer-links-item">
            {t('footer.deliveryDetails')}
          </span>
        </div>
        <div className="footer-links-column">
          <span className="footer-links-item">{t('footer.terms')}</span>
          <Link className="footer-links-item" target="_blank" to="/policy">
            {t('footer.privacy')}
          </Link>
        </div>
      </div>
      {isOpenModal && <SupportModal onClose={handleToggleModal} />}
    </div>
  );
};

export default memo(FooterLinks);
