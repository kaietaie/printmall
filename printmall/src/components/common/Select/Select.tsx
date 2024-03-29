import React, { memo } from 'react';
import squish from '../../../Helpers/ClassNameHelper';

import './Select.sass';

interface selectOption {
  value: string;
  label: string;
}

interface SelectProps {
  className?: string;
  options: selectOption[];
  label: string;
  name: string;
  value: string;
  onChange: (e: React.ChangeEvent<any>) => void;
  onBlur?: (e: any) => void;
  fullWidth?: boolean;
}

const Select: React.FC<SelectProps> = ({
  className,
  options,
  label,
  onBlur,
  onChange,
  value,
  fullWidth,
  name,
}) => {
  return (
    <div
      className={squish`
        select
        ${fullWidth ? 'full-width' : ''}
        ${className ? className : ''}
      `}
    >
      <label htmlFor={name}>{label}</label>
      <select
        defaultChecked={true}
        onBlur={onBlur}
        onChange={onChange}
        value={value}
        name={name}
        id={name}
      >
        {options.map((option) => {
          return (
            <option key={option.value} value={option.value}>
              {option.label}
            </option>
          );
        })}
      </select>
    </div>
  );
};

export default memo(Select);
