import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../../../store/store';
import { CartState } from '../../../types/Cart';
import { selectCartItems } from '../../../store/cart/cartSelectors';
import CartProductItem from '../CartProductItem/CartProductItem';
import { useTranslation } from 'react-i18next';
import SubTotal from './SubTotal';
import { memo, useEffect } from 'react';
import { getTotals } from '../../../store/cart/cartSlice';
import cookies from 'js-cookie';

import './OrderDetails.sass';

const OrderDetails = () => {
  const currentLanguage = cookies.get('i18next') || 'ua';
  const isUkrainianLanguage = currentLanguage === 'ua';
  const { t } = useTranslation();
  const items = useSelector<RootState, CartState['items']>(selectCartItems);
  const dispatch = useDispatch<AppDispatch>();

  useEffect(() => {
    dispatch(getTotals());
  }, [items, dispatch]);

  return (
    <div className="order-details">
      <h2 className="order-details-title">{t('payment.orderDetailsTitle')}</h2>
      <div className="order-details-items">
        {items.map((item) => (
          <CartProductItem
            isOrderDetails
            key={item.sku_cart_product_id}
            product={item}
          />
        ))}
      </div>
      <SubTotal />
      {!isUkrainianLanguage && (
        <>
          <span className="order-details-message">
            &#8226; Shipping costs depend on your location
          </span>
          <span className="order-details-message">
            &#8226; Prices do not include VAT
          </span>
        </>
      )}
    </div>
  );
};

export default memo(OrderDetails);
