import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';

const SendEmailInput = () => {
  return (
    <div className="send-email-container">
      <input placeholder="Email address" className="send-email-input" />
      <button className="send-email-button">
        <ArrowForward />
      </button>
    </div>
  );
};

export default SendEmailInput;
