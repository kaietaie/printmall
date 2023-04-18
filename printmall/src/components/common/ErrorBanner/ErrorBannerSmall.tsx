import React, { memo } from 'react';
import errorImage from '../../images/fail_banner.png';

import './ErrorBanner.sass';
interface ErrorBannerSmallProps {
  message: string;
}

const ErrorBannerSmall: React.FC<ErrorBannerSmallProps> = ({ message }) => {
  return (
    <div className="error-banner-small">
      <h3 className="error-banner-small-message">{message}</h3>
      <img className="error-banner-image" src={errorImage} alt="error" />
    </div>
  );
};

export default memo(ErrorBannerSmall);
