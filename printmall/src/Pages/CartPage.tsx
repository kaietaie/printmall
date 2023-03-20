import CartProducts from '../components/CartProducts';
import React, { useEffect } from 'react';
import './Pages.sass';

const CartPage = () => {
  useEffect(() => {
    document.body.classList.add('purchasing-page');

    return () => {
      document.body.classList.remove('purchasing-page');
    };
  }, []);

  return <CartProducts />;
};
export default CartPage;
