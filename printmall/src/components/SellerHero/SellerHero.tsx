import { memo } from 'react';
import Banner from './Banner';
import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { selectSeller } from '../../store/seller/sellerSelectors';
import { Seller } from '../../types/Sellers';
import defaultAvatar from '../images/defaultImages/avatar_big.png';

import './SellerHero.sass';

const SellerHero = () => {
  const seller = useSelector<RootState, Seller | null>(selectSeller);

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
