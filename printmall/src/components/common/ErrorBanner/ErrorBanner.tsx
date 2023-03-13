import './ErrorBanner.sass';
import errorImage from '../../images/fail_banner.png';
const ErrorBanner = () => {
  return (
    <div className="error-banner">
      <h1 className="error-banner-title">Oops!</h1>
      <span className="error-banner-message">You mustn’t be here!</span>
      <img className="error-banner-image" src={errorImage} alt="error" />
    </div>
  );
};

export default ErrorBanner;
