import React, { memo, useEffect } from 'react';
import squish from '../../Helpers/ClassNameHelper';
import { useTranslation } from 'react-i18next';
import QuantityChangeButton from '../common/Buttons/QuantityChangeButton';
import { Color, Product } from '../../types/Product';

interface ProductContentPickersProps {
  colors: Color[];
  quantity: number;
  selectedColor: string;
  onColorPick: (color: string) => void;
  onIncrease: () => void;
  onDecrease: () => void;
  onSizeChange: (event: React.ChangeEvent<HTMLSelectElement>) => void;
  sizeColor: Product['size_color'];
  isSizeChosen: boolean;
}

const ProductContentPickers: React.FC<ProductContentPickersProps> = ({
  colors,
  selectedColor,
  onColorPick,
  quantity,
  onDecrease,
  onIncrease,
  onSizeChange,
  sizeColor,
  isSizeChosen,
}) => {
  const { t } = useTranslation();
  const sizes = sizeColor[selectedColor];

  useEffect(() => {
    onColorPick(selectedColor || colors[0].color);
  }, [colors, onColorPick, selectedColor]);

  const handleColorPick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.currentTarget.dataset.color) {
      onColorPick(e.currentTarget.dataset.color);
    }
  };

  return (
    <div className="product-content-pickers">
      <div className="product-content-color-picker">
        <span className="product-content-picker-title">
          {t('product.colorPicker')}
        </span>

        <div className="product-content-color-picker-colors">
          {colors.map(({ color }) => (
            <div
              data-color={color}
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
              onClick={handleColorPick}
            ></div>
          ))}
        </div>
      </div>

      <div className="product-content-pickers-box">
        {sizes && (
          <div
            className={squish`
              product-content-size-picker
              ${!isSizeChosen ? 'error' : ''}
            `}
          >
            <label className="product-content-picker-title" htmlFor="size">
              {t('product.sizePicker')}
            </label>
            <select
              className="product-content-size-picker-select"
              onChange={onSizeChange}
              name="size"
              id="size"
            >
              <option value=""></option>
              {sizes.map((size) => (
                <option key={size} value={size}>
                  {size}
                </option>
              ))}
            </select>
            {!isSizeChosen && (
              <span className="product-content-size-picker-error-message">
                {t('product.sizePickerErrorMessage')}
              </span>
            )}
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
