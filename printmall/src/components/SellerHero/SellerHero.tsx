import Banner from './Banner';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { memo, useEffect } from 'react';
import { fetchSellerByNameThunk } from '../../store/seller/sellerThunks';
import { RootState } from '../../store/store';
import defaultAvatar from '../images/defaultImages/avatar_big.png';
import './SellerHero.sass';

const SellerHero = () => {
  const { sellerName } = useParams<{ sellerName: string }>();
  const dispatch = useDispatch();
  const seller = useSelector((state: RootState) => state.seller.seller);

  useEffect(() => {
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-ignore
    dispatch(fetchSellerByNameThunk(sellerName));
  }, [dispatch, sellerName]);

  if (seller === null) {
    return <div>Loading...</div>;
  }

  return (
    <div className="seller-hero">
      <Banner />
      <div className="seller-hero-info">
        <img
          className="seller-hero-image"
          src={defaultAvatar}
          alt="Seller avatar"
        />
        <h1 className="seller-hero-title">{seller.seller_name}</h1>
        <span className="seller-hero-announcement">
          {seller.seller_announcement}
        </span>
      </div>
    </div>
  );
};

export default memo(SellerHero);
