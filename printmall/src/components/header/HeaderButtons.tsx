import {ReactComponent as HeartIcon} from "../images/header-heart.svg";
import {ReactComponent as SearchIcon} from "../images/header-search.svg";
import {ReactComponent as BasketIcon} from "../images/header-shopping-basket.svg";
const HeaderButtons = () => {
  return (
    <div className="header-buttons">
      <HeartIcon/>
      <SearchIcon/>
      <BasketIcon/>
    </div>
  )
}

export default HeaderButtons