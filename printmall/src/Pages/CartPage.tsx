import React from 'react';
import CartProducts from '../components/CartProducts';
import ReturnButton from '../components/common/Buttons/ReturnButton';
import { useTranslation } from 'react-i18next';
import PurchaseStatus from '../components/common/PurchaseStatus';

import './Pages.sass';

const CartPage = () => {
  const { t } = useTranslation();

  return (
    <div className="cart-page">
      <ReturnButton />
      <PurchaseStatus currentStep="cart" />
      <h1 className="cart-page-title">{t('cart.title')}</h1>
      <CartProducts />
    </div>
  );
};

export default CartPage;
