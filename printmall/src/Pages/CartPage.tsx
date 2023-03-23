import CartProducts from '../components/CartProducts';
import React, { useEffect } from 'react';
import './Pages.sass';
import ReturnButton from '../components/common/Buttons/ReturnButton';
import { useTranslation } from 'react-i18next';
import PurchaseStatus from '../components/common/PurchaseStatus';

const CartPage = () => {
  const { t } = useTranslation();

  useEffect(() => {
    document.body.classList.add('purchasing-page');

    return () => {
      document.body.classList.remove('purchasing-page');
    };
  }, []);

  return (
    <div className="cart-products">
      <ReturnButton />
      <PurchaseStatus currentStep="cart" />
      <h1 className="cart-products-title">{t('cart.title')}</h1>
      <CartProducts />
    </div>
  );
};

export default CartPage;
