import React from 'react';
import Select, {
  ActionMeta,
  GroupBase,
  OptionsOrGroups,
  PropsValue,
  SingleValue,
} from 'react-select';
import squish from '../../../Helpers/ClassNameHelper';

import './SelectSearch.sass';

export type ReactSelectOptionsType =
  | OptionsOrGroups<string, GroupBase<string>>
  | undefined;

export type ReactSelectValueType = PropsValue<string> | undefined;

interface SelectSearchProps {
  className?: string;
  options: ReactSelectOptionsType;
  label: string;
  value: ReactSelectValueType;
  onChange:
    | ((newValue: SingleValue<string>, actionMeta: ActionMeta<string>) => void)
    | undefined;
  defaultInputValue: string;
  // onBlur?: (e: any) => void;
  // fullWidth?: boolean;
}

const SelectSearch: React.FC<SelectSearchProps> = ({
  options,
  value,
  label,
  onChange,
  className,
  defaultInputValue,
}) => {
  return (
    <div
      className={squish`
        select-search
        ${className ? className : ''}
      `}
    >
      <label htmlFor="country">{label}</label>
      <Select
        defaultInputValue={defaultInputValue}
        styles={{
          control: (baseStyles) => ({
            ...baseStyles,
            // borderColor: state.isFocused ? '#CCCCCC' : '#2AA5BE',
            borderColor: '#CCCCCC',
            height: 48,
            borderRadius: 6,
          }),
        }}
        options={options}
        value={value}
        onChange={onChange}
      />
    </div>
  );
};

export default SelectSearch;
