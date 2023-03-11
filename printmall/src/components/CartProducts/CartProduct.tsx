import React from 'react';
import { ReactComponent as CloseIcon } from '../images/close-icon.svg';
import { CartProduct } from '../../types/Cart';
import QuantityChangeButton from '../common/Buttons/QuantityChangeButton';
import { addItem, decreaseItem, removeItem } from '../../store/cart/cartSlice';
import { useDispatch } from 'react-redux';
import { AppDispatch } from '../../store/store';

interface CartProductItemProps {
  product: CartProduct;
}
const CartProductItem: React.FC<CartProductItemProps> = ({ product }) => {
  const dispatch = useDispatch<AppDispatch>();

  const handleDecrease = (): void => {
    dispatch(decreaseItem(product.cart_product_id));
  };

  const handleIncrease = (): void => {
    dispatch(addItem(product));
  };

  const handleRemove = (): void => {
    dispatch(removeItem(product.cart_product_id));
  };

  //todo: find better solution to access server images
  const serverUrl = 'http://localhost:5000';

  return (
    <div className="cart-product">
      <div className="cart-product-info">
        <img
          className="cart-product-image"
          src={serverUrl + product.product_image}
          alt="Product image"
        />
        <div>
          <span className="cart-product-name">{product.product_name}</span>
          <span>
            {product.product_color}
            {product.product_size}
          </span>
        </div>
      </div>

      <div className="cart-product-actions">
        <QuantityChangeButton
          quantity={product.quantity}
          onIncrease={handleIncrease}
          onDecrease={handleDecrease}
        />

        <span className="cart-product-price">
          ${product.product_price * product.quantity}
        </span>

        <button className="cart-product-close-button" onClick={handleRemove}>
          <CloseIcon />
        </button>
      </div>
    </div>
  );
};

export default CartProductItem;
