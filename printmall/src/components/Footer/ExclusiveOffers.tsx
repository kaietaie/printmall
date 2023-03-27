import SendEmailInput from './SendEmailInput';

const ExclusiveOffers = () => {
  return (
    <div className="exclusive-offers">
      <h3 className="exclusive-offers-title">Get Exclusive Offers!</h3>
      <SendEmailInput />
      <p className="exclusive-offers-message">
        Subscribe to our newsletter to receive exclusive content, special
        discounts, and be the first to know about new releases from our
        marketplace.
      </p>
    </div>
  );
};

export default ExclusiveOffers;
