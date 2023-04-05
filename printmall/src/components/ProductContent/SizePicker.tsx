import React, { memo } from 'react';
import squish from '../../Helpers/ClassNameHelper';
import { useTranslation } from 'react-i18next';

interface SizePickerProps {
  isSizeChosen: boolean;
  onSizeChange: (event: React.ChangeEvent<HTMLSelectElement>) => void;
  sizes: string[];
}
const SizePicker: React.FC<SizePickerProps> = ({
  isSizeChosen,
  onSizeChange,
  sizes,
}) => {
  const { t } = useTranslation();
  return (
    <div
      className={squish`
        size-picker
        ${!isSizeChosen ? 'error' : ''}
      `}
    >
      <label className="product-content-picker-title" htmlFor="size">
        {t('product.sizePicker')}
      </label>
      <select
        className="size-picker-select"
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
        <span className="size-picker-error-message">
          {t('product.sizePickerErrorMessage')}
        </span>
      )}
    </div>
  );
};
export default memo(SizePicker);
