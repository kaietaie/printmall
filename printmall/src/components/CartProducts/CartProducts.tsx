import React, { memo, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../../store/store';
import { CartState, clearCart, getTotals } from '../../store/cart/cartSlice';
import CartProductItem from './CartProductItem';
import ReturnButton from '../common/Buttons/ReturnButton';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import Button from '../common/Buttons';
import './CartProducts.sass';
import { useTranslation } from 'react-i18next';
import { useNavigate } from 'react-router-dom';

const CartProducts: React.FC = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();
  const { items, cartTotalAmount } = useSelector<RootState, CartState>(
    (state) => state.cart
  );

  const dispatch = useDispatch<AppDispatch>();

  useEffect(() => {
    dispatch(getTotals());
  }, [items, dispatch]);

  const handleClearCart = (): void => {
    dispatch(clearCart());
  };

  const handleGoToCheckout = () => {
    navigate(`/checkout`);
  };

  return (
    <div className="cart-products">
      <ReturnButton />
      <h1 className="cart-products-title">{t('cart.title')}</h1>
      {items.length > 0 ? (
        <>
          <div className="cart-products-container">
            <div className="cart-products-items">
              {items.map((item) => (
                <CartProductItem key={item.cart_product_id} product={item} />
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
    </div>
  );
};

export default memo(CartProducts);
