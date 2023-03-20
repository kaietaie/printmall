import React, { memo } from 'react';
import { ReactComponent as CloseIcon } from '../../images/close-icon.svg';
import { CartProduct } from '../../../types/Cart';
import QuantityChangeButton from '../Buttons/QuantityChangeButton';
import {
  addItem,
  decreaseItem,
  removeItem,
} from '../../../store/cart/cartSlice';
import { useDispatch } from 'react-redux';
import { AppDispatch } from '../../../store/store';
import defaultProductImage from '../../images/defaultImages/product_default.png';
import ImageComponent from '../ImageComponent';

import './CartProductItem.sass';
import { useTranslation } from 'react-i18next';

interface CartProductItemProps {
  product: CartProduct;
  isOrderDetails?: boolean;
}
const CartProductItem: React.FC<CartProductItemProps> = ({
  product,
  isOrderDetails,
}) => {
  const { t } = useTranslation();
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
          <div className="cart-product-options">
            <span className="cart-product-options-color">
              {product.product_color}
            </span>
            <span>{`, ${product.product_size}`}</span>
            {isOrderDetails &&
              ` x ${product.quantity}${t('common.cartItemQuantity')}`}
          </div>
        </div>
      </div>

      <div className="cart-product-actions">
        {!isOrderDetails && (
          <QuantityChangeButton
            quantity={product.quantity}
            onIncrease={handleIncrease}
            onDecrease={handleDecrease}
          />
        )}

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
