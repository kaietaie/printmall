import './OrderDetails.sass';
import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { CartState } from '../../types/Cart';
import { selectCartItems } from '../../store/cart/cartSelectors';

const OrderDetails = () => {
  const items = useSelector<RootState, CartState['items']>(selectCartItems);
  console.log(items);
  return (
    <div>
      <h2>Order details</h2>
    </div>
  );
};

export default OrderDetails;
