import React, { memo, useEffect, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { fetchProductByIdThunk } from '../../store/products/productThunks';
import { selectProductById } from '../../store/products/productSlice';
import ProductContentPickers from './ProductContentPickers';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import { ReactComponent as SupportIcon } from '../images/support-agent.svg';
import Button from '../common/Buttons';
import { useTranslation } from 'react-i18next';
import ReturnButton from '../common/Buttons/ReturnButton';
import { CartProduct } from '../../types/Cart';
import { addItem } from '../../store/cart/cartSlice';
import './ProductContent.sass';

const ProductContent = () => {
  const { t } = useTranslation();
  const { productId } = useParams<{ productId: string }>();
  const product = useSelector(selectProductById(Number(productId)));
  const navigate = useNavigate();
  const dispatch = useDispatch();

  const [selectedColor, setSelectedColor] = useState<string>('');
  const [quantity, setQuantity] = useState(1);
  const [selectedSize, setSelectedSize] = useState('');

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

  const defaultProductImage = product.colors[0]?.product_image;

  const cartProduct: CartProduct = {
    product_id: product.product_id,
    cart_product_id:
      product.product_name + (selectedSize || product.product_size[0]),
    product_name: product.product_name,
    product_image: tShirtImage || defaultProductImage,
    product_price: product.product_price,
    // color: selectedColor,
    product_size: selectedSize || product.product_size[0],
    quantity: quantity,
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

  const handleAddToCart = (): void => {
    dispatch(addItem(cartProduct));
    navigate(`/cart`);
  };

  //todo: find better solution to access server images
  const serverUrl = 'http://localhost:5000';

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
            onSizeChange={handleSizeChange}
            onIncrease={handleIncreaseQuantity}
            onDecrease={handleDecreaseQuantity}
            product={product}
            quantity={quantity}
            onClick={handleColorPick}
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
