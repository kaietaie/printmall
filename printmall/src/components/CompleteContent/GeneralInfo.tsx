import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { CartState } from '../../types/Cart';
import { selectCartTotalAmount } from '../../store/cart/cartSelectors';

const GeneralInfo = () => {
  const subTotalAmount = useSelector<RootState, CartState['cartTotalAmount']>(
    selectCartTotalAmount
  );

  const general_info = [
    { title: 'Order number :', value: '51755' },
    { title: 'Date :', value: 'November 19, 2023' },
    { title: 'Total :', value: '344' },
    { title: 'Payment method:', value: 'PayPal' },
  ];

  //simulating adding shipping price
  // const total = subTotalAmount + 10;

  return (
    <div className="general-info">
      {general_info.map((item) => {
        return (
          <div key={item.title} className="general-info-item">
            <span className="general-info-item-title">{item.title}</span>
            <span className="general-info-item-value">{item.value}</span>
          </div>
        );
      })}

      {/*<div className="general-info-item">*/}
      {/*  <span className="general-info-item-title">Date :</span>*/}
      {/*  <span className="general-info-item-value">3344</span>*/}
      {/*</div>*/}

      {/*<div className="general-info-item">*/}
      {/*  <span className="general-info-item-title">Total :</span>*/}
      {/*  <span className="general-info-item-value">{total}</span>*/}
      {/*</div>*/}

      {/*<div className="general-info-item">*/}
      {/*  <span className="general-info-item-title">Payment method:</span>*/}
      {/*  <span className="general-info-item-value">PayPal</span>*/}
      {/*</div>*/}
    </div>
  );
};

export default GeneralInfo;
