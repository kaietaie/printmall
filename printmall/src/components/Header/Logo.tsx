import React, { memo } from 'react';
import { ReactComponent as AppLogo } from '../images/logo.svg';
import { Link } from 'react-router-dom';

const Logo: React.FC = () => {
  return (
    <Link to="/seller/Go_A">
      <AppLogo className="logo" />
    </Link>
  );
};

export default memo(Logo);
