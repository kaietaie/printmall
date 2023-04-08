import { memo } from 'react';
import { useSelector } from 'react-redux';
import { RootState } from '../../../store/store';
import { CartState } from '../../../types/Cart';
import { selectCartTotalAmount } from '../../../store/cart/cartSelectors';
import { useTranslation } from 'react-i18next';
import { selectShippingPrice } from '../../../store/shipping/shippingSelectors';

const OrderDetailsInfo = () => {
  const { t } = useTranslation();
  const subTotalAmount = useSelector<RootState, CartState['cartTotalAmount']>(
    selectCartTotalAmount
  );
  const shippingPrice = useSelector<RootState, string>(selectShippingPrice);

  return (
    <>
      <div className="sub-total">
        <span>{t('orderDetails.subtotal')}</span>
        <span>${subTotalAmount}</span>
      </div>

      {shippingPrice && (
        <>
          <div className="sub-total">
            <span>{t('orderDetails.shipping')}</span>
            <span>${shippingPrice}</span>
          </div>
          <div className="sub-total">
            <span>{t('orderDetails.total')}</span>
            <span>${shippingPrice + subTotalAmount}</span>
          </div>
        </>
      )}
    </>
  );
};

export default memo(OrderDetailsInfo);
