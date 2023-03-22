import React, { memo, useState } from 'react';
import { ReactComponent as StarIcon } from './icons/star.svg';
import { Link } from 'react-router-dom';
import Ellipsis from '../Ellipsis/Ellipsis';
import defaultProductImage from '../../images/defaultImages/product_default.png';
import ImageComponent from '../ImageComponent';
import { Product } from '../../../types/Product';

import './ProductCard.sass';

interface ProductCardProps {
  product: Product;
}

const ProductCard: React.FC<ProductCardProps> = ({ product }) => {
  const {
    product_id,
    colors,
    product_price,
    product_name,
    seller_name,
    seller_sales,
    seller_rating,
  } = product;
  const [selectedColor, setSelectedColor] = useState<string>(colors[0].color);

  const handleColorPick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.currentTarget.dataset.color) {
      setSelectedColor(e.currentTarget.dataset.color);
    }
  };

  const tShirtImage = colors.find(
    (color) => color.color === selectedColor
  )?.product_image;

  return (
    <div className="product-card">
      <Link to={`/products/${product_id}`}>
        <ImageComponent
          className="product-card-img"
          imageUrl={tShirtImage}
          alt="product"
          defaultImageUrl={defaultProductImage}
        />

        <div className="product-card-colors">
          {colors.map((color) => (
            <div
              data-color={color.color}
              key={color.color}
              className="product-card-color"
              style={{
                backgroundColor: color.color,
              }}
              onMouseEnter={handleColorPick}
            ></div>
          ))}
        </div>
        <div className="product-card-seller-info">
          {/*<Link*/}
          {/*  to={`/${seller_name.toLowerCase()}`}*/}
          {/*  className="product-card-seller-name"*/}
          {/*>*/}
          {/*  {seller_name}*/}
          {/*</Link>*/}
          <span className="product-card-seller-name">{seller_name}</span>
          <div className="product-card-seller-info-rating">
            {seller_rating && seller_sales && (
              <>
                <StarIcon />
                <span>{`${seller_rating} | ${seller_sales}`}</span>
              </>
            )}
          </div>
        </div>
        <span className="product-card-name">
          <Ellipsis text={product_name} maxLength={30} />
        </span>
        <span className="product-card-price">{`$${product_price}`}</span>
      </Link>
    </div>
  );
};
export default memo(ProductCard);
