import { memo } from 'react';
import Logo from '../Header/Logo';
import FooterLinks from './FooterLinks';
import ExclusiveOffers from './ExclusiveOffers';
import { useTranslation } from 'react-i18next';

import './Footer.sass';

const Footer = () => {
  const { t } = useTranslation();

  return (
    <div className="footer">
      <div className="container footer-container">
        <div className="footer-content">
          <div className="footer-info">
            <Logo />
            <p className="footer-info-message">{t('footer.infoMessage')}</p>
          </div>
          <FooterLinks />
          <ExclusiveOffers />
        </div>
        <span className="footer-copyright">
          {`© Copyright 2023, ${t('footer.copyright')} Kram`}
        </span>
      </div>
    </div>
  );
};

export default memo(Footer);
