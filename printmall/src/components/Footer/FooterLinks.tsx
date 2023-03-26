// import { useTranslation } from 'react-i18next';
import { useState } from 'react';
import SupportModal from '../common/SupportModal/SupportModal';

const FooterLinks = () => {
  // const { t } = useTranslation();
  const [isOpenModal, setOpenIsModal] = useState(false);

  const handleToggleModal = () => {
    setOpenIsModal(!isOpenModal);
  };

  return (
    <div className="footer-links">
      <div>
        <h3 className="footer-links-title">Pages</h3>
        <div className="footer-links-container">
          <div className="footer-links-column">
            <button onClick={handleToggleModal} className="footer-links-item">
              Contact Us
            </button>
            <span className="footer-links-item">Delivery Details</span>
          </div>
          <div className="footer-links-column">
            <span className="footer-links-item">Terms & Conditions</span>
            <span className="footer-links-item">Privacy Policy</span>
          </div>
        </div>
      </div>
      {isOpenModal && <SupportModal onClose={handleToggleModal} />}
    </div>
  );
};

export default FooterLinks;
