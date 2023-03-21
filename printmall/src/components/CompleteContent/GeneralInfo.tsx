import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { CartState } from '../../types/Cart';
import { selectCartTotalAmount } from '../../store/cart/cartSelectors';

const GeneralInfo = () => {
  const subTotalAmount = useSelector<RootState, CartState['cartTotalAmount']>(
    selectCartTotalAmount
  );

  //simulating adding shipping price
  const total = subTotalAmount + 10;

  return (
    <div className="general-info">
      <div className="general-info-item">
        <span className="general-info-item-title">Order number :</span>
        <span className="general-info-item-value">51755</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">Date :</span>
        <span className="general-info-item-value">3344</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">Total :</span>
        <span className="general-info-item-value">{total}</span>
      </div>

      <div className="general-info-item">
        <span className="general-info-item-title">Payment method:</span>
        <span className="general-info-item-value">PayPal</span>
      </div>
    </div>
  );
};

export default GeneralInfo;
