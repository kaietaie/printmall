import PayPalCheckoutButton from './PayPalCheckoutButton';
import { useTranslation } from 'react-i18next';
import MonobankButton from './MonobankButton';

import './PaymentOptions.sass';

const PaymentOptions = () => {
  const { t } = useTranslation();
  return (
    <div className="payment-options">
      <h2 className="payment-options-title">{t('payment.optionsTitle')}</h2>
      <PayPalCheckoutButton />
      <MonobankButton />
    </div>
  );
};
export default PaymentOptions;
