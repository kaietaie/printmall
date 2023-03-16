import React, { memo, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
// import { selectProductById } from '../../store/products/productSlice';
import ProductContentPickers from './ProductContentPickers';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import { ReactComponent as SupportIcon } from '../images/support-agent.svg';
import Button from '../common/Buttons';
import { useTranslation } from 'react-i18next';
import ReturnButton from '../common/Buttons/ReturnButton';
import { CartProduct } from '../../types/Cart';
import { addItem } from '../../store/cart/cartSlice';
import { AppDispatch, RootState } from '../../store/store';
import ImageComponent from '../common/ImageComponent';
import defaultProductImage from '../images/defaultImages/product_default.png';
import Carousel from './Carousel';
import filterAvailableColorsBySize from '../../utils/filterAvailableColorsBySize';
import { selectProduct } from '../../store/products/productsSelectors';
import { Product } from '../../types/Product';
import Loader from '../common/Loader';

import './ProductContent.sass';

const ProductContent = () => {
  const { t } = useTranslation();
  const product = useSelector<RootState, Product | null>(selectProduct);
  const navigate = useNavigate();
  const dispatch = useDispatch<AppDispatch>();

  const [selectedColor, setSelectedColor] = useState<string>('');
  const [quantity, setQuantity] = useState(1);
  const [selectedSize, setSelectedSize] = useState('');

  if (!product) {
    return <Loader />;
  }

  const {
    colors,
    size_color,
    sizes,
    product_price,
    product_id,
    product_name,
    product_description,
  } = product;

  const productSize = selectedSize || sizes[0];
  const availableColors = filterAvailableColorsBySize(
    colors,
    productSize,
    size_color
  );

  const tShirtImage = availableColors.find(({ color }) => {
    return color === selectedColor;
  })?.product_image;

  const firstProductImage = availableColors[0].product_image;
  const productImage = tShirtImage || firstProductImage;
  const cartProductId =
    product_name + (selectedSize || sizes[0]) + selectedColor;

  const cartProduct: CartProduct = {
    product_id: product_id,
    cart_product_id: cartProductId,
    product_name: product_name,
    product_image: productImage,
    product_price: product_price,
    product_color: selectedColor,
    product_size: productSize,
    quantity: quantity,
  };

  const handleColorPick = (color: string) => {
    setSelectedColor(color);
  };

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
    dispatch(addItem(cartProduct));
    navigate(`/cart`);
  };

  return (
    <div className="product-content">
      <ReturnButton />
      <div className="product-content-section">
        <div className="product-content-image-picker">
          <Carousel onColorPick={handleColorPick} colors={availableColors} />
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
            onSizeChange={handleSizeChange}
            onIncrease={handleIncreaseQuantity}
            onDecrease={handleDecreaseQuantity}
            colors={availableColors}
            quantity={quantity}
            onColorPick={handleColorPick}
            selectedColor={selectedColor}
          />
          <div className="product-content-actions">
            <Button onClick={handleAddToCart} iconEnd={<BasketIcon />}>
              {t('product.supportButton')}
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
    </div>
  );
};

export default memo(ProductContent);
