import React, { memo, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { fetchProductByIdThunk } from '../../store/products/productThunks';
import { selectProductById } from '../../store/products/productSlice';
import ProductContentPickers from './ProductContentPickers';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import { ReactComponent as SupportIcon } from '../images/support-agent.svg';
import Button from '../common/Buttons';
import { useTranslation } from 'react-i18next';
import ReturnButton from '../common/Buttons/ReturnButton';
import './ProductContent.sass';

const ProductContent = () => {
  const { productId } = useParams<{ productId: string }>();
  const product = useSelector(selectProductById(Number(productId)));
  const [selectedColor, setSelectedColor] = useState<string>('');
  const dispatch = useDispatch();
  const { t } = useTranslation();

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
      <ReturnButton />
      <div className="product-content-section">
        <img
          className="product-content-image"
          src={serverUrl + (tShirtImage || defaultProductImage)}
          alt="Product image"
        />
        <div className="product-content-info">
          <h2 className="product-content-info-title">{product.product_name}</h2>
          <span className="product-content-price">
            ${product.product_price}
          </span>
          <p className="product-content-price-description">
            {product.product_description}
          </p>
          <ProductContentPickers
            product={product}
            onClick={handleColorPick}
            selectedColor={selectedColor}
          />
          <div className="product-content-actions">
            <Button iconEnd={<BasketIcon />}>
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
