import { ReactComponent as PhoneIcon } from '../images/phone.svg';
import { ReactComponent as Burger } from '../images/burger.svg';
import HeaderButtons from './HeaderButtons';

const HeaderContent = () => {
  return (
    <div className="header-content">
      <PhoneIcon />
      <span className="header-phone">1-888-676-2660</span>
      <span className="header-content-live-chat">Live Chat!</span>
      <HeaderButtons />
      <Burger />
    </div>
  );
};
export default HeaderContent;
