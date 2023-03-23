import React, { memo, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import ProductContentPickers from './ProductContentPickers';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import { ReactComponent as SupportIcon } from '../images/support-agent.svg';
import Button from '../common/Buttons';
import { useTranslation } from 'react-i18next';
import ReturnButton from '../common/Buttons/ReturnButton';
import { CartProduct } from '../../types/Cart';
import { addItem, getTotals } from '../../store/cart/cartSlice';
import { AppDispatch, RootState } from '../../store/store';
import ImageComponent from '../common/ImageComponent';
import defaultProductImage from '../images/defaultImages/product_default.png';
import Carousel from './Carousel';
import { selectProduct } from '../../store/products/productsSelectors';
import { Product } from '../../types/Product';
import Loader from '../common/Loader';
import makeSku from '../../utils/makeSku';
import ProductSideBar from './ProductSideBar';

import './ProductContent.sass';

const ProductContent = () => {
  const { t } = useTranslation();
  const product = useSelector<RootState, Product | null>(selectProduct);
  const dispatch = useDispatch<AppDispatch>();

  const [selectedColor, setSelectedColor] = useState<string>('');
  const [quantity, setQuantity] = useState(1);
  const [selectedSize, setSelectedSize] = useState('');
  const [isOpenSideBar, setOpenIsSideBar] = useState(false);

  if (!product) {
    return <Loader />;
  }

  const {
    product_id,
    seller_id,
    colors,
    size_color,
    sizes,
    product_price,
    product_name,
    product_description,
    sku_color,
    sku_size,
  } = product;

  const productSize = selectedSize || sizes[0];

  const tShirtImage = colors.find(({ color }) => {
    return color === selectedColor;
  })?.product_image;

  const firstProductImage = colors[0].product_image;
  const productImage = tShirtImage || firstProductImage;

  const sku_cart_product_id = makeSku({
    seller_id,
    product_id,
    product_size: sku_size[selectedSize || sizes[0]],
    product_color: sku_color[selectedColor],
  });

  const cartProduct: CartProduct = {
    product_id,
    sku_cart_product_id,
    product_name,
    product_image: productImage,
    product_price,
    product_color: selectedColor,
    product_size: productSize,
    quantity,
  };

  const toggleDrawer = () => {
    setOpenIsSideBar(!isOpenSideBar);
  };

  function handleColorPick(color: string | undefined) {
    if (color) {
      setSelectedColor(color);
    }
  }

  const handleIncreaseQuantity = () => {
    dispatch(addItem(cartProduct));
    setQuantity(quantity + 1);
  };

  const handleDecreaseQuantity = () => {
    if (quantity > 1) {
      setQuantity(quantity - 1);
    }
  };

  const handleSizeChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    setSelectedSize(event.target.value);
  };

  const handleAddToCart = () => {
    toggleDrawer();
    dispatch(addItem(cartProduct));
    dispatch(getTotals());
  };

  return (
    <div className="product-content">
      <ReturnButton />
      <div className="product-content-section">
        <div className="product-content-image-picker">
          <Carousel onColorPick={handleColorPick} colors={colors} />
          <ImageComponent
            className="product-content-image"
            imageUrl={productImage}
            defaultImageUrl={defaultProductImage}
            alt="product"
          />
        </div>

        <div className="product-content-info">
          <h2 className="product-content-info-title">{product_name}</h2>
          <span className="product-content-price">${product_price}</span>
          <p className="product-content-price-description">
            {product_description}
          </p>

          <ProductContentPickers
            sizeColor={size_color}
            onSizeChange={handleSizeChange}
            onIncrease={handleIncreaseQuantity}
            onDecrease={handleDecreaseQuantity}
            colors={colors}
            quantity={quantity}
            onColorPick={handleColorPick}
            selectedColor={selectedColor}
          />
          <div className="product-content-actions">
            <Button onClick={handleAddToCart} iconEnd={<BasketIcon />}>
              {t('product.cartButton')}
            </Button>
            <div className="product-content-support">
              <SupportIcon />
              <span className="product-content-support-text">
                {t('product.supportText')}
              </span>
              <a className="product-content-support-text">
                {t('product.supportLink')}
              </a>
            </div>
          </div>
        </div>
      </div>
      {isOpenSideBar && (
        <ProductSideBar product={cartProduct} onClose={toggleDrawer} />
      )}
    </div>
  );
};

export default memo(ProductContent);
