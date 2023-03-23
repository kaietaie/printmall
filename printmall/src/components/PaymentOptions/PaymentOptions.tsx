import PayPalCheckoutButton from '../PayPalCheckoutButton';

import './PaymentOptions.sass';
import { useTranslation } from 'react-i18next';

const PaymentOptions = () => {
  const { t } = useTranslation();
  return (
    <div className="payment-options">
      <h2 className="payment-options-title">{t('payment.optionsTitle')}</h2>
      <PayPalCheckoutButton />
    </div>
  );
};
export default PaymentOptions;
