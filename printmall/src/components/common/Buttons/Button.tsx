import React from 'react';
import squish from '../../../Helpers/ClassNameHelper';
import './Button.sass';

interface ButtonProps {
  onClick?: () => void;
  className?: string;
  isDisabled?: boolean;
  type?: 'primary' | 'secondary' | 'quaternary';
  children: string;
  iconEnd?: React.ReactElement<React.SVGProps<SVGSVGElement>>;
}

const Button: React.FC<ButtonProps> = ({
  children,
  iconEnd,
  type = 'primary',
  isDisabled = false,
  className,
  onClick,
}) => {
  return (
    <button
      onClick={onClick}
      disabled={isDisabled}
      className={squish`
        button
        button-${type}
        ${className ? className : ''}
      `}
    >
      {children}
      {iconEnd && iconEnd}
    </button>
  );
};

export default Button;
