import React, { memo, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../../store/store';
import { CartState, getTotals } from '../../store/cart/cartSlice';
import CartProductItem from './CartProductItem';
import ReturnButton from '../common/Buttons/ReturnButton';

import './CartProducts.sass';

const CartProducts: React.FC = () => {
  const { items, cartTotalAmount } = useSelector<RootState, CartState>(
    (state) => state.cart
  );

  const dispatch = useDispatch<AppDispatch>();

  useEffect(() => {
    dispatch(getTotals());
  }, [items, dispatch]);

  return (
    <div className="cart-products">
      <ReturnButton />
      <h1 className="cart-products-title">Shopping Cart</h1>
      <div className="cart-products-items">
        {items.map((item) => (
          <CartProductItem key={item.cart_product_id} product={item} />
        ))}
      </div>
      <div className="cart-products-total">
        Total:&nbsp;
        <span>${cartTotalAmount}</span>
      </div>
    </div>
  );
};
export default memo(CartProducts);
