import React from 'react';

interface QuantityChangeButtonProps {
  quantity: number;
  onIncrease: () => void;
  onDecrease: () => void;
}
const QuantityChangeButton: React.FC<QuantityChangeButtonProps> = ({
  onDecrease,
  quantity,
  onIncrease,
}) => {
  return (
    <div className="quantity-change-buttons">
      <button onClick={onDecrease}>-</button>
      <span>{quantity}</span>
      <button onClick={onIncrease}>+</button>
    </div>
  );
};

export default QuantityChangeButton;
