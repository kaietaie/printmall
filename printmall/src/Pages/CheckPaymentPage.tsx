import React, { memo, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import {
  selectOrderCaptureStatus,
  selectOrderId,
} from '../store/payment/paymentSelectors';
import { useNavigate } from 'react-router-dom';
import Loader from '../components/common/Loader/Loader';
import { captureOrderThunk } from '../store/payment/paymentThunks';
import { AppDispatch, RootState } from '../store/store';
import { toast } from 'react-toastify';
import { PaymentState } from '../types/Payment';
import { useTranslation } from 'react-i18next';

const CheckPaymentPage = () => {
  const { t } = useTranslation();
  const orderId = useSelector<RootState, PaymentState['orderId']>(
    selectOrderId
  );
  const status = useSelector<RootState, PaymentState['status']>(
    selectOrderCaptureStatus
  );
  const navigate = useNavigate();
  const dispatch = useDispatch<AppDispatch>();

  useEffect(() => {
    if (orderId) {
      dispatch(captureOrderThunk({ orderId, type: 'monobank' }));
    }

    if (status === 'failed') {
      navigate(`/payment`);
      toast.error(t('payment.failedPaymentMessage'));
    }

    if (status === 'succeeded') {
      navigate(`/complete`);
    }
  }, [dispatch, navigate, orderId, status, t]);

  return <Loader />;
};

export default memo(CheckPaymentPage);
