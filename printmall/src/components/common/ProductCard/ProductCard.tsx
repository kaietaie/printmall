import React, { memo, useState } from 'react';
import { ReactComponent as StarIcon } from './icons/star.svg';
import { Product } from '../../../types/Products';
import { Link } from 'react-router-dom';
import './ProductCard.sass';
import Ellipsis from '../Ellipsis/Ellipsis';

interface ProductCardProps {
  product: Product;
}

const ProductCard: React.FC<ProductCardProps> = ({ product }) => {
  const {
    colors,
    product_price,
    product_name,
    seller_name,
    seller_sales,
    seller_rating,
  } = product;

  const [selectedColor, setSelectedColor] = useState<string>(colors[0].color);

  const handleColorPick = (color: string) => {
    setSelectedColor(color);
  };

  const tShirtImage = colors.find(
    (color) => color.color === selectedColor
  )?.product_image;

  //todo: find better solution to access server images
  const serverUrl = 'http://localhost:5000';

  return (
    <div className="product-card">
      <img
        className="product-card-img"
        // src={tShirtImage}
        src={serverUrl + tShirtImage}
        alt="T-shirt"
      />
      <div className="product-card-colors">
        {colors.map((color) => (
          <div
            key={color.color}
            className="product-card-color"
            style={{
              backgroundColor: color.color,
            }}
            onMouseEnter={() => handleColorPick(color.color)}
          ></div>
        ))}
      </div>
      <div className="product-card-seller-info">
        <Link
          to={`/${seller_name.toLowerCase()}`}
          className="product-card-seller-name"
        >
          {seller_name}
        </Link>
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
    </div>
  );
};
export default memo(ProductCard);
