import React, { memo } from 'react';
import squish from '../../../Helpers/ClassNameHelper';

import './Checkbox.sass';

interface CheckboxProps {
  label: string;
  checked: boolean;
  onChange: () => void;
  className?: string;
}

const Checkbox: React.FC<CheckboxProps> = ({
  label,
  checked,
  onChange,
  className,
}) => {
  return (
    <label
      className={squish`
        checkbox 
        ${className ? className : ''}
      `}
    >
      <input onChange={onChange} checked={checked} type="checkbox" />
      {label}
    </label>
  );
};

export default memo(Checkbox);
