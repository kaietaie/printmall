import { memo } from 'react';
import '../../i18n/config';
// import { ReactComponent as Burger } from '../images/burger.svg';
import HeaderButtons from './HeaderButtons';
import { useTranslation } from 'react-i18next';
import LanguageSwitcher from './LanguageSwitcher';
import useScreen from '../hooks/useScreen';
import HeaderContacts from './HeaderContacts';

const HeaderContent = () => {
  const { isMobile } = useScreen();

  return (
    <div className="header-content">
      {!isMobile() && <HeaderContacts />}
      <HeaderButtons />
      <LanguageSwitcher />
      {/*<Burger />*/}
    </div>
  );
};
export default memo(HeaderContent);
