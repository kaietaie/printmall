import Logo from './Logo';
import HeaderContent from './HeaderContent';
import './Header.sass';

const Header = () => {
  return (
    <header className="header">
      <div className="container header-container">
        <Logo />
        <HeaderContent />
      </div>
    </header>
  );
};

export default Header;
