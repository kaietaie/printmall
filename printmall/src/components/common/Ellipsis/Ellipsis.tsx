import React from 'react';

interface Props {
  text: string;
  maxLength: number;
}

const Ellipsis: React.FC<Props> = ({ text, maxLength }) => {
  if (text.length <= maxLength) {
    return <>{text}</>;
  }

  return <>{`${text.slice(0, maxLength)}...`}</>;
};

export default Ellipsis;
