import React, { memo, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../../store/store';
import { CartState, clearCart, getTotals } from '../../store/cart/cartSlice';
import CartProductItem from './CartProductItem';
import ReturnButton from '../common/Buttons/ReturnButton';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import Button from '../common/Buttons';
import './CartProducts.sass';

const CartProducts: React.FC = () => {
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

  return (
    <div className="cart-products">
      <ReturnButton />
      <h1 className="cart-products-title">Shopping Cart</h1>
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
              Delete All
            </button>
          </div>
          <div className="cart-products-total">
            Subtotal:&nbsp;
            <span>${cartTotalAmount}</span>
          </div>
          <Button
            className="cart-products-checkout-button"
            iconEnd={<ArrowForward />}
          >
            Proceed to checkout
          </Button>
          <span className="cart-products-bottom-text">
            All the taxes will be calculated while checkout
          </span>
        </>
      ) : (
        <div>Your cart is empty.</div>
      )}
    </div>
  );
};

export default memo(CartProducts);
