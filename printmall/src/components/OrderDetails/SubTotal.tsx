import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { CartState } from '../../types/Cart';
import { selectCartTotalAmount } from '../../store/cart/cartSelectors';
import { useTranslation } from 'react-i18next';

const SubTotal = () => {
  const { t } = useTranslation();
  const subTotalAmount = useSelector<RootState, CartState['cartTotalAmount']>(
    selectCartTotalAmount
  );

  return (
    <div className="sub-total">
      <span>{t('cart.totalAmount')}</span>
      <span>${subTotalAmount}</span>
    </div>
  );
};

export default SubTotal;
