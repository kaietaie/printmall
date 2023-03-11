import '../../i18n/config';
import { ReactComponent as PhoneIcon } from '../images/phone.svg';
// import { ReactComponent as Burger } from '../images/burger.svg';
import HeaderButtons from './HeaderButtons';
import { useTranslation } from 'react-i18next';
import LanguageSwitcher from './LanguageSwitcher';
import useScreen from '../hooks/useScreen';

const HeaderContent = () => {
  const { t } = useTranslation();
  const { isMobile } = useScreen();

  return (
    <div className="header-content">
      {!isMobile() && (
        <>
          <PhoneIcon />
          <span className="header-phone">1-888-676-2660</span>
          <span className="header-content-live-chat">
            {t('header.liveChat')}
          </span>
        </>
      )}

      <HeaderButtons />
      <LanguageSwitcher />
      {/*<Burger />*/}
    </div>
  );
};
export default HeaderContent;
