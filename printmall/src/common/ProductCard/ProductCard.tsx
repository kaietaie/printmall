import React, { useState } from 'react';
import { ReactComponent as StarIcon } from './icons/star.svg';
import './ProductCard.sass';

interface Color {
  name: string;
  image: string;
}

interface Product {
  id: number;
  name: string;
  colors: Color[];
  seller: string;
  sales: number;
  price: number;
  rating: number;
}

interface ProductCardProps {
  product: Product;
}

const ProductCard: React.FC<ProductCardProps> = ({ product }) => {
  const { colors, name, seller, price, rating, sales } = product;

  const [selectedColor, setSelectedColor] = useState<string>(colors[0].name);

  const handleColorPick = (color: string) => {
    setSelectedColor(color);
  };

  const tShirtImage = colors.find(
    (color) => color.name === selectedColor
  )?.image;

  return (
    <div>
      <img className="product-card-img" src={tShirtImage} alt="T-shirt" />
      <div className="product-card-colors">
        {colors.map((color) => (
          <div
            key={color.name}
            className="product-card-color"
            style={{
              backgroundColor: color.name,
            }}
            onMouseEnter={() => handleColorPick(color.name)}
          ></div>
        ))}
      </div>
      <div className="product-card-seller-info">
        <span>{seller}</span>
        <div className="product-card-seller-info-rating">
          <StarIcon />
          {/*<span>{rating}</span>|<span>{sales}</span>*/}
          <span>{`${rating} | ${sales}`}</span>
        </div>
      </div>
      <span className="product-card-name">{name}</span>
      <span className="product-card-price">{`$${price}`}</span>
    </div>
  );
};
export default ProductCard;
