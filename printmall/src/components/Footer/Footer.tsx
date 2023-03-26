import Logo from '../Header/Logo';
import FooterLinks from './FooterLinks';

import './Footer.sass';

const Footer = () => {
  return (
    <div className="footer">
      <div className="container footer-container">
        <div className="footer-info">
          <Logo />
          <p className="footer-info-message">
            Shop the latest trends and styles from our marketplace, and stand
            out with unique and personalized printed clothes.
          </p>
        </div>
        <FooterLinks />
        <div>dfv</div>
      </div>
    </div>
  );
};

export default Footer;
