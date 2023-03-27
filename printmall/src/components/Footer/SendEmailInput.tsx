import React, { memo, useState } from 'react';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import { useTranslation } from 'react-i18next';
import { sendUserEmail } from '../../api/supportApi';
import { toast } from 'react-toastify';
import squish from '../../Helpers/ClassNameHelper';

const SendEmailInput = () => {
  const { t } = useTranslation();
  const [email, setEmail] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    try {
      await sendUserEmail(email);
      toast.info('Email is added');
      setEmail('');
      setError('');
    } catch (e: any) {
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

      return toast.error(t('getExclusiveOffers.failedSendEmail'));
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
          ${error ? 'error' : ''}
        `}
        type="email"
        name="email"
        placeholder={
          t('getExclusiveOffers.inputPlaceholder') || 'Email address'
        }
        value={email}
        onChange={handeInputChange}
      />
      {error && <p className="send-email-error-message">{error}</p>}
      <button type="submit" className="send-email-button">
        <ArrowForward />
      </button>
    </form>
  );
};

export default memo(SendEmailInput);
