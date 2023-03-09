import squish from '../../Helpers/ClassNameHelper';
import React, { memo } from 'react';
import { Product } from '../../types/Products';
import { useTranslation } from 'react-i18next';

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
  const { t } = useTranslation();

  return (
    <div className="product-content-pickers">
      <div className="product-content-color-picker">
        <span className="product-content-picker-title">
          {t('product.colorPicker')}
        </span>

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
            {t('product.sizePicker')}
          </label>
          <select name="size" id="size">
            {product.product_size.map((size) => (
              <option key={size} value={size}>
                {size}
              </option>
            ))}
          </select>
        </div>

        <div className="product-content-quantity-picker">
          <span className="product-content-picker-title">
            {t('product.quantityPicker')}
          </span>

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
