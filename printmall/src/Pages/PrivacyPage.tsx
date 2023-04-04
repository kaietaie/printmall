import { Link } from 'react-router-dom';

const PrivacyPage = () => {
  return (
    <div className="privacy-page">
      <h1 className="privacy-page-title">Privacy Policy</h1>

      <p>Updated: 04 Apr 2023</p>
      <p>
        This Privacy Policy describes how Kram Market collects, uses, and shares
        personal information of users of this website, located at&nbsp;
        <Link to="www.kram.market">www.kram.market</Link>&nbsp; (the “Site”). By
        using this Site, you consent to the collection, use, and disclosure of
        your personal information as described in this Privacy Policy.
      </p>

      <h3>Information Collection and Use</h3>
      <p>
        We collect information from you when you register on our Site or place
        an order. When ordering or registering on our Site, as appropriate, you
        may be asked to enter your name, email address, mailing address, phone
        number or credit card information. We will not sell, trade, or otherwise
        transfer your personally identifiable information to outside parties.
      </p>

      <h3>Information Sharing</h3>
      <p>
        We do not share personal information with third parties except as
        necessary to carry out our business or as required by law or other legal
        processes.
      </p>

      <h3>Cookies</h3>
      <p>
        We use cookies to help us remember and process the items in your
        shopping cart and compile aggregate data about site traffic and site
        interaction so that we can offer better site experiences and tools in
        the future.
      </p>

      <h3>Security</h3>
      <p>
        We implement a variety of security measures to maintain the safety of
        your personal information when you place an order or enter, submit, or
        access your personal information.
      </p>

      <h3>Changes to this Privacy Policy</h3>
      <p>
        Kram Market may change this Privacy Policy from time to time. If we make
        changes, we will notify you by revising the date at the top of the
        policy and, in some cases, we may provide you with additional notice
        (such as adding a statement to our homepage or sending you an email
        notification).
      </p>
    </div>
  );
};

export default PrivacyPage;
