import workOnPageImage from '../components/images/working_on_page.png';
import ExclusiveOffers from '../components/Footer/ExclusiveOffers';
import { memo } from 'react';

const TemporaryHomePage = () => {
  return (
    <div className="temporary-home-page">
      <p className="temporary-home-page-message">
        Our team is currently engaged in developing this webpage. By subscribing
        to the news, you can be among the first to receive updates about its
        launch.
      </p>
      <img src={workOnPageImage} alt="Work on page" />
      <ExclusiveOffers />
    </div>
  );
};

export default memo(TemporaryHomePage);
