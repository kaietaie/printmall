// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-nocheck
import React, { useEffect } from 'react';
import { getMonobankOrderDetails } from '../api/paymentApi';
import { useSelector } from 'react-redux';
import { selectOrderId } from '../store/payment/paymentSelectors';
import { useNavigate } from 'react-router-dom';
import Loader from '../components/common/Loader/Loader';

const CheckPaymentPage = () => {
  const orderId = useSelector(selectOrderId);
  const navigate = useNavigate();
console.log(orderId)
   
getMonobankOrderDetails(orderId)
.then((result) => {
//   console.log({result});
navigate(`/complete`);
})
.catch((error) => {
//   console.log({error});
navigate(`/payment`);
});
    
  return (
<Loader />
  );
};

export default CheckPaymentPage;
