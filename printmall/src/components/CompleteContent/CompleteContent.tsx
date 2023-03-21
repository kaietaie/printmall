import './CompleteContent.sass';
import GeneralInfo from './GeneralInfo';

const CompleteContent = () => {
  return (
    <div className="complete-content">
      <div className="complete-content-gratitude">
        <span className="complete-content-gratitude-message">
          Thank you. Your order has been received.
        </span>
      </div>
      <GeneralInfo />
    </div>
  );
};

export default CompleteContent;
