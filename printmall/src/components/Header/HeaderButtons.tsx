// import { ReactComponent as HeartIcon } from '../images/header-heart.svg';
// import { ReactComponent as SearchIcon } from '../images/header-search.svg';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import Badge from '../Badge';
import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { CartState } from '../../store/cart/cartSlice';

const HeaderButtons = () => {
  const { cartTotalQuantity } = useSelector<RootState, CartState>(
    (state) => state.cart
  );

  return (
    <div className="header-buttons">
      {/*<HeartIcon />*/}
      {/*<SearchIcon />*/}
      <Badge content={cartTotalQuantity}>
        <button className="header-basket-button">
          <BasketIcon />
        </button>
      </Badge>
    </div>
  );
};

export default HeaderButtons;
