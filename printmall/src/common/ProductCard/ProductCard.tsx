import React, { useState } from 'react';
import { ReactComponent as StarIcon } from './icons/star.svg';
import { Product } from '../../types/Products';
import './ProductCard.sass';

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

  return (
    <div>
      <img className="product-card-img" src={tShirtImage} alt="T-shirt" />
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
        <span className="product-card-seller-name">{seller_name}</span>
        <div className="product-card-seller-info-rating">
          <StarIcon />
          <span>{`${seller_rating} | ${seller_sales}`}</span>
        </div>
      </div>
      <span className="product-card-name">{product_name}</span>
      <span className="product-card-price">{`$${product_price}`}</span>
    </div>
  );
};
export default ProductCard;
