import { memo } from 'react';
// import { ReactComponent as HeartIcon } from '../images/header-heart.svg';
// import { ReactComponent as SearchIcon } from '../images/header-search.svg';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import Badge from '../Badge';
import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { Link } from 'react-router-dom';
import { selectCartTotalQuantity } from '../../store/cart/cartSelectors';
import { CartState } from '../../types/Cart';

const HeaderButtons = () => {
  const cartTotalQuantity = useSelector<
    RootState,
    CartState['cartTotalQuantity']
  >(selectCartTotalQuantity);

  return (
    <div className="header-buttons">
      {/*<HeartIcon />*/}
      {/*<SearchIcon />*/}
      <Badge content={cartTotalQuantity}>
        <Link to="/cart" className="header-basket-link">
          <BasketIcon />
        </Link>
      </Badge>
    </div>
  );
};

export default memo(HeaderButtons);
