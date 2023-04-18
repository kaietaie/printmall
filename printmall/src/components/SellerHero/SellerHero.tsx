import React, { memo } from 'react';
import Banner from './Banner';
import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import {
  selectSeller,
  selectSellerStatus,
} from '../../store/seller/sellerSelectors';
import { Seller, SellerState } from '../../types/Sellers';
import defaultAvatar from '../images/defaultImages/avatar_big.png';
import ErrorBannerSmall from '../common/ErrorBanner/ErrorBannerSmall';
import { useTranslation } from 'react-i18next';

import './SellerHero.sass';

const SellerHero = () => {
  const { t } = useTranslation();
  const seller = useSelector<RootState, Seller | null>(selectSeller);
  const sellerStatus = useSelector<RootState, SellerState['status']>(
    selectSellerStatus
  );

  const isError = sellerStatus === 'failed';

  if (isError) {
    return <ErrorBannerSmall message={t('errorBanner.sellerInfoMessage')} />;
  }

  return (
    <div className="seller-hero">
      <Banner />
      <div className="seller-hero-info">
        {/*<AvatarUpload />*/}
        {/*<mvp solution />*/}
        <img
          className="seller-hero-avatar"
          src={defaultAvatar}
          alt="Seller avatar"
        />
        <h1 className="seller-hero-title">{seller?.seller_name}</h1>
        <span className="seller-hero-announcement">
          {seller?.seller_announcement}
        </span>
      </div>
    </div>
  );
};

export default memo(SellerHero);
