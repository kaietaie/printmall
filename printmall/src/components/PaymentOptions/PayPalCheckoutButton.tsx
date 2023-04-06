import { useEffect, useState } from 'react';
import { PayPalButtons } from '@paypal/react-paypal-js';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../../store/store';
import { useNavigate } from 'react-router-dom';
import ErrorBanner from '../common/ErrorBanner';
import { createPayPalOrder } from '../../api/paymentApi';
import { toast } from 'react-toastify';
import { useTranslation } from 'react-i18next';
import { captureOrderThunk } from '../../store/payment/paymentThunks';
import {
  selectPaymentData,
  selectPayPalPaymentStatus,
} from '../../store/payment/paymentSelectors';
import { PaymentData, PaymentDetails } from '../../types/Payment';

const PayPalCheckoutButton = () => {
  const { t } = useTranslation();
  const dispatch = useDispatch<AppDispatch>();
  const navigate = useNavigate();
  const [paidFor, setPaidFor] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const payPalPaymentData = useSelector<RootState, PaymentData>(
    selectPaymentData
  );

  const status = useSelector<RootState, PaymentDetails['status']>(
    selectPayPalPaymentStatus
  );

  useEffect(() => {
    if (status === 'COMPLETED') {
      setPaidFor(true);
    }
  }, [dispatch, status]);

  const handleCreateOrder = async (): Promise<string> => {
    try {
      return await createPayPalOrder(payPalPaymentData);
    } catch (error) {
      console.error(error);
      setError('Failed to create PayPal order');
      throw new Error('Failed to create PayPal order');
    }
  };

  const handleApprove = async (data: any): Promise<void> => {
    try {
      dispatch(captureOrderThunk({ orderId: data.orderID, type: 'payPal' }));
    } catch (error) {
      console.error(error);
      setError('Error capturing PayPal order');
    }
  };

  if (paidFor) {
    navigate('/complete');
  }

  if (error) {
    return <ErrorBanner />;
  }

  return (
    <PayPalButtons
      className="pay-pal-buttons"
      // fundingSource={FUNDING.PAYPAL}
      createOrder={handleCreateOrder}
      onApprove={handleApprove}
      onError={(err) => {
        setError(err.toString());
        console.error('PayPal Checkout onError', err);
      }}
      onCancel={() => {
        toast.info(t('payment.cancelMessage'));
      }}
      style={{ color: 'blue', shape: 'pill', height: 55 }}
    />
  );
};

export default PayPalCheckoutButton;
