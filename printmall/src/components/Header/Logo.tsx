import { ReactComponent as AppLogo } from '../images/logo.svg';
import { useNavigate } from 'react-router-dom';

const Logo = () => {
  const navigate = useNavigate();

  const handleClick = () => {
    navigate(`/seller/Go_A`);
  };

  return <AppLogo className="logo" onClick={handleClick} />;
};

export default Logo;
