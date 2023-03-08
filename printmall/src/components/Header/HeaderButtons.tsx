// import { ReactComponent as HeartIcon } from '../images/header-heart.svg';
// import { ReactComponent as SearchIcon } from '../images/header-search.svg';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import Badge from '../Badge';

const HeaderButtons = () => {
  return (
    <div className="header-buttons">
      {/*<HeartIcon />*/}
      {/*<SearchIcon />*/}
      <Badge content={2}>
        <button className="header-basket-button">
          <BasketIcon />
        </button>
      </Badge>
    </div>
  );
};

export default HeaderButtons;
