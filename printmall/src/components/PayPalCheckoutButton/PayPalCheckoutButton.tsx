import { useState } from 'react';
import { PayPalButtons } from '@paypal/react-paypal-js';
import { SkuCartItem } from '../../types/Cart';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../../store/store';
import { selectPayPalCartItems } from '../../store/cart/cartSelectors';
import { clearCart } from '../../store/cart/cartSlice';
import { useNavigate } from 'react-router-dom';
import ErrorBanner from '../common/ErrorBanner';
import { capturePayPalOrder, createPayPalOrder } from '../../api/paymentApi';
import { toast } from 'react-toastify';
import { useTranslation } from 'react-i18next';

import './PayPalCheckoutButton.sass';

const PayPalCheckoutButton = () => {
  const { t } = useTranslation();
  const dispatch = useDispatch<AppDispatch>();
  const navigate = useNavigate();
  const [paidFor, setPaidFor] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const skuCartItems = useSelector<RootState, SkuCartItem[]>(
    selectPayPalCartItems
  );

  const handleCreateOrder = async (data: any): Promise<string> => {
    try {
      return await createPayPalOrder(skuCartItems);
    } catch (error) {
      console.error(error);
      setError('Failed to create PayPal order');
      throw new Error('Failed to create PayPal order');
    }
  };

  const handleApprove = async (data: any): Promise<void> => {
    try {
      const response = await capturePayPalOrder(data.orderID);
      console.log(response)
      if (response.respon.status === 'COMPLETED') {
        dispatch(clearCart());
        setPaidFor(true);
      }
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
