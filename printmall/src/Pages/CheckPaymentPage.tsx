import React, { memo, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { selectOrderId } from '../store/payment/paymentSelectors';
import { useNavigate } from 'react-router-dom';
import Loader from '../components/common/Loader/Loader';
import { captureOrderThunk } from '../store/payment/paymentThunks';
import { AppDispatch } from '../store/store';

const CheckPaymentPage = () => {
  const orderId = useSelector(selectOrderId);
  const navigate = useNavigate();
  const dispatch = useDispatch<AppDispatch>();

  useEffect(() => {
    if (orderId) {
      dispatch(captureOrderThunk({ orderId: orderId, type: 'monobank' }))
        .then(() => {
          navigate(`/complete`);
        })
        .catch((error) => {
          console.log({ error });
          navigate(`/payment`);
        });
    }
  }, [dispatch, navigate, orderId]);

  return <Loader />;
};

export default memo(CheckPaymentPage);
