import React, { memo } from 'react';
import { Drawer } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import Button from '../common/Buttons';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import CartProductItem from '../common/CartProductItem';
import { CartProduct } from '../../types/Cart';

import './ProductSIdeBar.sass';
import CloseButton from '../common/Buttons/CloseButton';

interface ProductSideBarProps {
  product: CartProduct;
  onClose: () => void;
}
const ProductSideBar: React.FC<ProductSideBarProps> = ({
  onClose,
  product,
}) => {
  const navigate = useNavigate();

  const handleGoToCart = () => {
    navigate(`/cart`);
  };
  const handleContinueShopping = () => {
    onClose();
  };

  return (
    <Drawer onClose={onClose} open anchor="right">
      <div className="product-side-bar">
        <CloseButton
          className="product-side-bar-close-button"
          onClick={onClose}
        />
        <h2 className="product-side-bar-title">Added to the cart!</h2>

        {product && <CartProductItem isOrderDetails product={product} />}
        <Button
          className="product-side-bar-button"
          iconEnd={<BasketIcon />}
          onClick={handleGoToCart}
        >
          Go to cart
        </Button>
        <Button
          className="product-side-bar-button"
          type="secondary"
          onClick={handleContinueShopping}
        >
          Continue shopping
        </Button>
      </div>
    </Drawer>
  );
};

export default memo(ProductSideBar);
