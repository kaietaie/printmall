import React, { memo, useEffect } from 'react';
import squish from '../../Helpers/ClassNameHelper';
import { useTranslation } from 'react-i18next';
import { Color } from '../../types/Product';

interface ColorPickerProps {
  colors: Color[];
  selectedColor: string;
  onColorPick: (color: string) => void;
}

const ColorPicker: React.FC<ColorPickerProps> = ({
  colors,
  selectedColor,
  onColorPick,
}) => {
  const { t } = useTranslation();

  useEffect(() => {
    onColorPick(selectedColor || colors[0].color);
  }, [colors, onColorPick, selectedColor]);

  const handleColorPick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.currentTarget.dataset.color) {
      onColorPick(e.currentTarget.dataset.color);
    }
  };

  return (
    <div className="color-picker">
      <span className="product-content-picker-title">
        {t('product.colorPicker')}
      </span>

      <div>
        {colors.map(({ color }) => (
          <div
            data-color={color}
            key={color}
            className={squish`
              color-picker-color
              ${color === selectedColor ? 'color-picker-color--selected' : ''}
            `}
            style={{
              backgroundColor: color,
            }}
            onClick={handleColorPick}
          ></div>
        ))}
      </div>
    </div>
  );
};

export default memo(ColorPicker);
