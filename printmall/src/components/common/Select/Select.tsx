import React from 'react';

import './Select.sass';

interface countryOption {
  value: string;
  label: string;
}

interface SelectProps {
  options: countryOption[];
  label: string;
  name: string;
  value: string;
  onChange: (e: React.ChangeEvent<any>) => void;
  onBlur: (e: any) => void;
}
const Select: React.FC<SelectProps> = ({
  options,
  label,
  onBlur,
  onChange,
  value,
}) => {
  return (
    <div className="select">
      <label htmlFor="country">{label}</label>
      <select
        onBlur={onBlur}
        onChange={onChange}
        value={value}
        name="country"
        id="country"
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

export default Select;
