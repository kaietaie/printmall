import React, { memo, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../../store/store';
import { CartState, getTotals } from '../../store/cart/cartSlice';
import CartProductItem from './CartProduct';
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
      {items.map((item) => (
        <CartProductItem
          key={`${item.product_id}-${item.product_size}`}
          product_id={item.product_id}
          product_image={item.product_image}
          product_name={item.product_name}
          product_price={item.product_price}
          quantity={item.quantity}
          product_size={item.product_size}
        />
      ))}
      <div className="cart-products-total">
        Total:&nbsp;
        <span>${cartTotalAmount}</span>
      </div>
    </div>
  );
};
export default memo(CartProducts);
