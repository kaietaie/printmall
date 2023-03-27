import Logo from '../Header/Logo';
import FooterLinks from './FooterLinks';

import './Footer.sass';
import ExclusiveOffers from './ExclusiveOffers';

const Footer = () => {
  return (
    <div className="footer">
      <div className="container footer-container">
        <div className="footer-content">
          <div className="footer-info">
            <Logo />
            <p className="footer-info-message">
              Shop the latest trends and styles from our marketplace, and stand
              out with unique and personalized printed clothes.
            </p>
          </div>
          <FooterLinks />
          <ExclusiveOffers />
        </div>
        <span className="footer-copyright">
          © Copyright 2023, All Rights Reserved by Kram
        </span>
      </div>
    </div>
  );
};

export default Footer;
