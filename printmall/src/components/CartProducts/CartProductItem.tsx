import React, { memo } from 'react';
import { ReactComponent as CloseIcon } from '../images/close-icon.svg';
import { CartProduct } from '../../types/Cart';
import QuantityChangeButton from '../common/Buttons/QuantityChangeButton';
import { addItem, decreaseItem, removeItem } from '../../store/cart/cartSlice';
import { useDispatch } from 'react-redux';
import { AppDispatch } from '../../store/store';
import defaultProductImage from '../images/defaultImages/product_default.png';
import ImageComponent from '../common/ImageComponent';

interface CartProductItemProps {
  product: CartProduct;
}
const CartProductItem: React.FC<CartProductItemProps> = ({ product }) => {
  const dispatch = useDispatch<AppDispatch>();

  const handleDecrease = (): void => {
    dispatch(decreaseItem(product.sku_cart_product_id));
  };

  const handleIncrease = (): void => {
    dispatch(addItem(product));
  };

  const handleRemove = (): void => {
    dispatch(removeItem(product.sku_cart_product_id));
  };

  return (
    <div className="cart-product">
      <div className="cart-product-info">
        <ImageComponent
          className="cart-product-image"
          defaultImageUrl={defaultProductImage}
          imageUrl={product.product_image}
          alt="product"
        />

        <div>
          <span className="cart-product-name">{product.product_name}</span>
          <span className="cart-product-options">
            {product.product_color}, {product.product_size}
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

export default memo(CartProductItem);
