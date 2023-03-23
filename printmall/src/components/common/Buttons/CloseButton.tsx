import React, { memo } from 'react';
import { ReactComponent as CloseIcon } from '../../images/close-icon.svg';
import squish from '../../../Helpers/ClassNameHelper';

interface CloseButtonProps {
  onClick: () => void;
  className?: string;
}

const CloseButton: React.FC<CloseButtonProps> = ({ onClick, className }) => {
  return (
    <button
      className={squish`
        close-button 
        ${className ? className : ''}
      `}
      onClick={onClick}
    >
      <CloseIcon />
    </button>
  );
};

export default memo(CloseButton);
