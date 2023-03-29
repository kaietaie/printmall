import React from 'react';
import PhoneInput from 'react-phone-input-2';
import squish from '../../../Helpers/ClassNameHelper';
import 'react-phone-input-2/lib/style.css';

import './TelephoneInput.sass';

interface TelephoneInputProps {
  label: string;
  name: string;
  value: string;
  error?: string | boolean | undefined;
  onChange: (value: string | undefined) => void;
  onBlur: (e: any) => void;
  fullWidth?: boolean;
}
const TelephoneInput: React.FC<TelephoneInputProps> = ({
  label,
  value,
  name,
  onChange,
  onBlur,
  error,
  fullWidth,
}) => {
  return (
    <div
      className={squish`
          telephone-input-container
          ${error ? 'error' : ''}
          ${fullWidth ? 'full-width' : ''}
        `}
    >
      <label className="telephone-input-label" htmlFor="phone">
        {label}
      </label>
      <PhoneInput
        inputClass="telephone-input"
        inputProps={{
          name: name,
          id: 'phone',
        }}
        country={'ua'}
        preferredCountries={['ua', 'pl', 'lt']}
        value={value}
        onChange={onChange}
        onBlur={onBlur}
      />
      {error && <span className="telephone-input-error-message">{error}</span>}
    </div>
  );
};

export default TelephoneInput;
