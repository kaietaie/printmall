import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { CartState } from '../../types/Cart';
import { selectCartTotalAmount } from '../../store/cart/cartSelectors';
import { useTranslation } from 'react-i18next';
import { useNavigate } from 'react-router-dom';

const SubTotal = () => {
  const navigate = useNavigate();

  const { t } = useTranslation();
  const subTotalAmount = useSelector<RootState, CartState['cartTotalAmount']>(
    selectCartTotalAmount
  );
  if (subTotalAmount === 0) {
    navigate(`/seller/Go_A`);
  }

  return (
    <div className="sub-total">
      <span>{t('cart.totalAmount')}</span>
      <span>${subTotalAmount}</span>
    </div>
  );
};

export default SubTotal;
