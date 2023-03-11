import CartProducts from '../components/CartProducts';
import React, { useEffect } from 'react';
import './Pages.sass';

const CartPage = () => {
  useEffect(() => {
    document.body.classList.add('cart-page');

    return () => {
      document.body.classList.remove('cart-page');
    };
  }, []);

  return <CartProducts />;
};
export default CartPage;
