import React, { memo, useEffect } from 'react';
import squish from '../../Helpers/ClassNameHelper';
import { Color } from '../../types/Products';
import { useTranslation } from 'react-i18next';
import QuantityChangeButton from '../common/Buttons/QuantityChangeButton';
import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';

interface ProductContentPickersProps {
  colors: Color[];
  quantity: number;
  selectedColor: string;
  onColorPick: (color: string) => void;
  onIncrease: () => void;
  onDecrease: () => void;
  onSizeChange: (event: React.ChangeEvent<HTMLSelectElement>) => void;
}

const ProductContentPickers: React.FC<ProductContentPickersProps> = ({
  colors,
  selectedColor,
  onColorPick,
  quantity,
  onDecrease,
  onIncrease,
  onSizeChange,
}) => {
  const { t } = useTranslation();
  const sizes = useSelector((state: RootState) => state.product.product?.sizes);

  useEffect(() => {
    onColorPick(selectedColor || colors[0].color);
  }, [colors, onColorPick, selectedColor]);

  return (
    <div className="product-content-pickers">
      <div className="product-content-color-picker">
        <span className="product-content-picker-title">
          {t('product.colorPicker')}
        </span>

        <div className="product-content-color-picker-colors">
          {colors.map(({ color }) => (
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
              onClick={() => onColorPick(color)}
            ></div>
          ))}
        </div>
      </div>

      <div className="product-content-pickers-box">
        {sizes && (
          <div className="product-content-size-picker">
            <label className="product-content-picker-title" htmlFor="size">
              {t('product.sizePicker')}
            </label>
            <select
              onChange={onSizeChange}
              name="size"
              id="size"
              defaultValue={sizes[0]}
            >
              {sizes.map((size) => (
                <option key={size} value={size}>
                  {size}
                </option>
              ))}
            </select>
          </div>
        )}

        <div className="product-content-quantity-picker">
          <span className="product-content-picker-title">
            {t('product.quantityPicker')}
          </span>

          <QuantityChangeButton
            quantity={quantity}
            onIncrease={onIncrease}
            onDecrease={onDecrease}
          />
        </div>
      </div>
    </div>
  );
};

export default memo(ProductContentPickers);
