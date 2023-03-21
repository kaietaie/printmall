import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { CartState } from '../../types/Cart';
import { selectCartTotalAmount } from '../../store/cart/cartSelectors';

const GeneralInfo = () => {
  type GeneralInfo = {
    order_number: string;
    date: string;
    total: string;
    payment_method: string;
    [key: string]: string; // index signature to allow for indexing with a string
  };

  const general_info_data = [
    { title: 'Order number:', id: 'order_number' },
    { title: 'Date:', id: 'date' },
    { title: 'Total:', id: 'total' },
    { title: 'Payment method:', id: 'payment_method' },
  ];

  const general_info: GeneralInfo = {
    order_number: '51755',
    date: 'November 19, 2023',
    total: '344',
    payment_method: 'PayPal',
  };

  //simulating adding shipping price
  // const total = subTotalAmount + 10;

  return (
    <div className="general-info">
      {general_info_data.map((item) => {
        return (
          <div key={item.id} className="general-info-item">
            <span className="general-info-item-title">{item.title}</span>
            <span className="general-info-item-value">
              {general_info[item.id]}
            </span>
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
