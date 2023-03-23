import React, { memo } from 'react';
import { Drawer } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import Button from '../common/Buttons';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import CartProductItem from '../common/CartProductItem';
import CloseButton from '../common/Buttons/CloseButton';
import { useTranslation } from 'react-i18next';
import { CartProduct } from '../../types/Cart';

import './ProductSIdeBar.sass';

interface ProductSideBarProps {
  product: CartProduct;
  onClose: () => void;
}
const ProductSideBar: React.FC<ProductSideBarProps> = ({
  onClose,
  product,
}) => {
  const { t } = useTranslation();
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
        <h2 className="product-side-bar-title">{t('productSideBar.title')}</h2>

        {product && <CartProductItem isOrderDetails product={product} />}
        <Button
          className="product-side-bar-button"
          iconEnd={<BasketIcon />}
          onClick={handleGoToCart}
        >
          {t('productSideBar.cartButton')}
        </Button>
        <Button
          className="product-side-bar-button"
          type="secondary"
          onClick={handleContinueShopping}
        >
          {t('productSideBar.continueButton')}
        </Button>
      </div>
    </Drawer>
  );
};

export default memo(ProductSideBar);
