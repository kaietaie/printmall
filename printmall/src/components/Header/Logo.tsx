import React, { memo } from 'react';
import { ReactComponent as AppLogo } from '../images/logo.svg';
import { Link, useLocation } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { AppDispatch } from '../../store/store';
import { clearPaymentDetails } from '../../store/payment/paymentSlice';

const Logo: React.FC = () => {
  const location = useLocation();
  const dispatch = useDispatch<AppDispatch>();

  const handleLogoClick = () => {
    if (location.pathname === '/complete') {
      dispatch(clearPaymentDetails());
    }
  };

  return (
    <Link to="/seller/Go_A">
      <AppLogo className="logo" onClick={handleLogoClick} />
    </Link>
  );
};

export default memo(Logo);
