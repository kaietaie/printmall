import React, { memo } from 'react';
import squish from '../../../Helpers/ClassNameHelper';

import './TextInput.tsx.sass';

interface TextInputProps {
  label: string;
  className?: string;
  name: string;
  value: string;
  error?: string | boolean | undefined;
  type: 'text' | 'email' | 'textarea' | 'tel' | 'number';
  placeholder?: string;
  onChange: (e: React.ChangeEvent<any>) => void;
  onBlur: (e: any) => void;
  fullWidth?: boolean;
}

const TextInput: React.FC<TextInputProps> = ({
  label,
  type,
  name,
  placeholder,
  error,
  className,
  onBlur,
  onChange,
  value,
  fullWidth,
}) => {
  return (
    <div
      className={squish`
      text-input
      ${className ? className : ''}
      ${error ? 'error' : ''}
      ${fullWidth ? 'full-width' : ''}
    `}
    >
      <label htmlFor="my-input">{label}</label>
      {type === 'textarea' ? (
        <textarea
          onChange={onChange}
          onBlur={onBlur}
          value={value}
          placeholder={placeholder}
          id="my-input"
          name={name}
        />
      ) : (
        <input
          onChange={onChange}
          onBlur={onBlur}
          value={value}
          placeholder={placeholder}
          id="my-input"
          type={type}
          name={name}
        />
      )}

      {error && <span className="text-input-error-message">{error}</span>}
    </div>
  );
};

export default memo(TextInput);
