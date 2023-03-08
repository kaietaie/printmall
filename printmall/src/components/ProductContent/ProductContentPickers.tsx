import squish from '../../Helpers/ClassNameHelper';
import React, { memo } from 'react';
import { Product } from '../../types/Products';

interface ProductContentPickersProps {
  product: Product;
  selectedColor: string;
  onClick: (color: string) => void;
}

const ProductContentPickers: React.FC<ProductContentPickersProps> = ({
  product,
  selectedColor,
  onClick,
}) => {
  return (
    <div className="product-content-pickers">
      <div className="product-content-color-picker">
        <span className="product-content-picker-title">Color</span>
        <div className="product-content-color-picker-colors">
          {product?.colors.map(({ color }) => (
            <div
              key={color}
              className={squish`
                  product-content-color-picker-color
                  ${
                    color === selectedColor
                      ? 'product-content-color-picker-color--selected'
                      : ''
                  }
                `}
              style={{
                backgroundColor: color,
              }}
              onClick={() => onClick(color)}
            ></div>
          ))}
        </div>
      </div>
      <div className="product-content-pickers-box">
        <div className="product-content-size-picker">
          <label className="product-content-picker-title" htmlFor="size">
            Size
          </label>
          <select name="country" id="size">
            <option value="XL">XL</option>
            <option value="L">L</option>
            <option value="XS">XS</option>
            <option value="S">S</option>
          </select>
        </div>

        <div className="product-content-quantity-picker">
          <span className="product-content-picker-title">Quantity</span>
          <div className="product-content-quantity-picker-buttons">
            <button>-</button>
            <span>01</span>
            <button>+</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default memo(ProductContentPickers);
