import React from 'react';
import squish from '../../Helpers/ClassNameHelper';
import './Button.sass';

interface ButtonProps {
  className?: string;
  isDisabled?: boolean;
  type?: 'primary' | 'secondary';
  children: string;
  icon?: React.ReactElement<React.SVGProps<SVGSVGElement>>;
}

const Button: React.FC<ButtonProps> = ({
  children,
  icon,
  type = 'primary',
  isDisabled = false,
  className
}) => {
  return (
    <button
      disabled={isDisabled}
      className={squish`
        button
        button-${type}
        ${className ? className : ''}
      `}>
      {children}
      {icon && icon}
    </button>
  );
};

export default Button;
