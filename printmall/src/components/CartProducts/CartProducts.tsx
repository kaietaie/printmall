import React, { memo, useCallback, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../../store/store';
import { clearCart, getTotals } from '../../store/cart/cartSlice';
import CartProductItem from '../common/CartProductItem/CartProductItem';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import Button from '../common/Buttons';
import { useTranslation } from 'react-i18next';
import { useNavigate } from 'react-router-dom';
import { CartState } from '../../types/Cart';
import {
  selectCartItems,
  selectCartTotalAmount,
} from '../../store/cart/cartSelectors';

import './CartProducts.sass';

const CartProducts: React.FC = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();
  const items = useSelector<RootState, CartState['items']>(selectCartItems);

  const cartTotalAmount = useSelector<RootState, CartState['cartTotalAmount']>(
    selectCartTotalAmount
  );

  const dispatch = useDispatch<AppDispatch>();

  useEffect(() => {
    dispatch(getTotals());
  }, [items, dispatch]);

  const handleClearCart = (): void => {
    dispatch(clearCart());
  };

  const handleGoToCheckout = useCallback(() => {
    navigate(`/checkout`);
  }, [navigate]);

  return (
    <>
      {items.length > 0 ? (
        <>
          <div className="cart-products-container">
            <div className="cart-products-items">
              {items.map((item) => (
                <CartProductItem
                  key={item.sku_cart_product_id}
                  product={item}
                />
              ))}
            </div>
            <button
              className="cart-products-delete-button"
              onClick={handleClearCart}
            >
              {t('cart.deleteAllButton')}
            </button>
          </div>
          <div className="cart-products-total">
            {t('cart.totalAmount')}:&nbsp;
            <span>${cartTotalAmount}</span>
          </div>
          <Button
            onClick={handleGoToCheckout}
            className="cart-products-checkout-button"
            iconEnd={<ArrowForward />}
          >
            {t('cart.checkoutButton')}
          </Button>
          <span className="cart-products-bottom-text">
            All the taxes will be calculated while checkout
          </span>
        </>
      ) : (
        <div>{t('cart.emptyMessage')}</div>
      )}
    </>
  );
};

export default memo(CartProducts);
