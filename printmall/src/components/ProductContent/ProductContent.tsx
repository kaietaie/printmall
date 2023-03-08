import React, { memo, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { fetchProductByIdThunk } from '../../store/products/productThunks';
import { selectProductById } from '../../store/products/productSlice';
import ProductContentPickers from './ProductContentPickers';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import { ReactComponent as SupportIcon } from '../images/support-agent.svg';
import Button from '../common/Button';

import './ProductContent.sass';

const ProductContent = () => {
  const { productId } = useParams<{ productId: string }>();
  const product = useSelector(selectProductById(Number(productId)));
  const [selectedColor, setSelectedColor] = useState<string>('');
  const dispatch = useDispatch();

  useEffect(() => {
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-ignore
    dispatch(fetchProductByIdThunk(productId));
  }, [dispatch, productId]);

  if (!product) {
    return <div>Loading...</div>;
  }

  const handleColorPick = (color: string) => {
    setSelectedColor(color);
  };

  const tShirtImage = product.colors.find(({ color }) => {
    return color === selectedColor;
  })?.product_image;

  //todo: find better solution to access server images
  const serverUrl = 'http://localhost:5000';

  const defaultProductImage = product.colors[0]?.product_image;

  return (
    <div className="product-content">
      <img
        className="product-content-image"
        src={serverUrl + (tShirtImage || defaultProductImage)}
        alt="Product image"
      />
      <div className="product-content-info">
        <h2 className="product-content-info-title">{product.product_name}</h2>
        <span className="product-content-price">${product.product_price}</span>
        <p className="product-content-price-description">
          {product.product_description}
        </p>
        <ProductContentPickers
          product={product}
          onClick={handleColorPick}
          selectedColor={selectedColor}
        />
        <div className="product-content-actions">
          <Button iconEnd={<BasketIcon />}>Add to cart</Button>
          <div className="product-content-support">
            <SupportIcon />
            <span className="product-content-support-text">
              Still have a question?
            </span>
            <a className="product-content-support-text">Write to us!</a>
          </div>
        </div>
      </div>
    </div>
  );
};

export default memo(ProductContent);
