import React, { memo, useState } from 'react';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import { useTranslation } from 'react-i18next';
import { sendUserEmail } from '../../api/supportApi';
import squish from '../../Helpers/ClassNameHelper';

const SendEmailInput = () => {
  const { t } = useTranslation();
  const [email, setEmail] = useState('');
  const [error, setError] = useState('');
  const [addedMessage, setAddedMessage] = useState('');

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    try {
      await sendUserEmail(email);
      setEmail('');
      setError('');
      const emailAddedMessage = t('getExclusiveOffers.addedEmailMessage');
      setAddedMessage(emailAddedMessage);
    } catch (e: any) {
      setAddedMessage('');
      const isAlreadyAdded = e.message === '409';
      const isInvalidEmail = e.message === '400';

      if (email === '') {
        const enterEmailErrorMessage = t('form.emailErrorEnter');
        return setError(enterEmailErrorMessage);
      }

      if (isAlreadyAdded) {
        const alreadyAddedErrorMessage = t(
          'getExclusiveOffers.alreadyAddedEmailError'
        );
        return setError(alreadyAddedErrorMessage);
      }

      if (isInvalidEmail) {
        const invalidEmailErrorMessage = t('form.emailErrorInvalid');
        return setError(invalidEmailErrorMessage);
      }

      const serverErrorMessage = t('getExclusiveOffers.failedSendEmail');
      setError(serverErrorMessage);
    }
  };

  const handeInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setEmail(event.target.value);
  };

  return (
    <form onSubmit={handleSubmit} className="send-email-form">
      <input
        className={squish`
          send-email-input
          ${error && 'error'}
          ${addedMessage && 'complete'}
        `}
        type="email"
        name="email"
        placeholder={
          t('getExclusiveOffers.inputPlaceholder') || 'Email address'
        }
        value={email}
        onChange={handeInputChange}
      />
      {(error || addedMessage) && (
        <p
          className={squish`
          send-email-error-message
          ${error && 'error'}
          ${addedMessage && 'complete'}
        `}
        >
          {error || addedMessage}
        </p>
      )}
      <button type="submit" className="send-email-button">
        <ArrowForward />
      </button>
    </form>
  );
};

export default memo(SendEmailInput);
