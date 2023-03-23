import { memo, useState } from 'react';
import { ReactComponent as PhoneIcon } from '../images/phone.svg';
import { useTranslation } from 'react-i18next';
import SupportModal from '../common/SupportModal';

const HeaderContacts = () => {
  const { t } = useTranslation();
  const [isOpenModal, setOpenIsModal] = useState(false);

  const handleToggleModal = () => {
    setOpenIsModal(!isOpenModal);
  };

  return (
    <>
      <PhoneIcon />
      <span className="header-contacts-phone">1-888-676-2660</span>
      <button
        onClick={handleToggleModal}
        className="header-contacts-support-button"
      >
        {t('header.contactUs')}
      </button>
      {isOpenModal && <SupportModal onClose={handleToggleModal} />}
    </>
  );
};

export default memo(HeaderContacts);
