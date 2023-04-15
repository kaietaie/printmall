import React from 'react';
import {
  ActionMeta,
  GroupBase,
  OptionsOrGroups,
  PropsValue,
  SingleValue,
} from 'react-select';
import squish from '../../../Helpers/ClassNameHelper';
import AsyncSelect from 'react-select/async';
import './SelectSearch.sass';

export type ReactSelectOptionsType =
  | OptionsOrGroups<string, GroupBase<string>>
  | undefined;

export type ReactSelectValueType = PropsValue<string> | undefined;

interface SelectSearchProps {
  className?: string;
  label: string;
  value: any;
  onChange:
    | ((newValue: SingleValue<string>, actionMeta: ActionMeta<string>) => void)
    | undefined;
  name?: string;
  fullWidth?: boolean;
  defaultOptions: any;
  loadOptions: any;
  // onBlur?: (e: any) => void;
  error?: any;
}

const SelectSearchAsync: React.FC<SelectSearchProps> = ({
  name,
  value,
  label,
  onChange,
  className,
  fullWidth,
  error,
  defaultOptions,
  loadOptions,
}) => {
  return (
    <div
      className={squish`
        select-search
        ${error ? 'error' : ''}
        ${fullWidth ? 'full-width' : ''}
        ${className ? className : ''}
      `}
    >
      <label htmlFor="country">{label}</label>
      <AsyncSelect
        name={name}
        styles={{
          control: (baseStyles) => ({
            ...baseStyles,
            // borderColor: state.isFocused ? '#CCCCCC' : '#2AA5BE',
            borderColor: `${error ? '#CE4257' : '#CCCCCC'}`,
            height: 48,
            borderRadius: 6,
          }),
        }}
        value={value}
        onChange={onChange}
        defaultOptions={defaultOptions}
        loadOptions={loadOptions}
        isClearable
        cacheOptions
      />

      {error && <span className="text-input-error-message">{error}</span>}
    </div>
  );
};

export default SelectSearchAsync;
