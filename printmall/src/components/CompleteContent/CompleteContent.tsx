import GeneralInfo from './GeneralInfo';
import CompleteDetails from './CompleteDetails';

import './CompleteContent.sass';

const CompleteContent = () => {
  return (
    <div className="complete-content">
      <div className="complete-content-gratitude">
        <span className="complete-content-gratitude-message">
          Thank you. Your order has been received.
        </span>
      </div>
      <GeneralInfo />
      <CompleteDetails />
    </div>
  );
};

export default CompleteContent;
