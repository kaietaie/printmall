import { memo, useEffect } from 'react';
import SellerHero from '../components/SellerHero';
import SellerProducts from '../components/SellerProducts';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../store/store';
import Loader from '../components/common/Loader';
import { fetchProductsThunk } from '../store/products/productThunks';
import { useParams } from 'react-router-dom';
import { fetchSellerByNameThunk } from '../store/seller/sellerThunks';
import { selectProductsStatus } from '../store/products/productsSelectors';
import { SellerState } from '../types/Sellers';
import { selectSellerStatus } from '../store/seller/sellerSelectors';
import Reviews from '../components/Reviews';
import ErrorBoundary from '../components/common/ErrorBoundary';

const SellerPage = () => {
  const { sellerName } = useParams<{ sellerName: string }>();
  const dispatch = useDispatch<AppDispatch>();
  const productsStatus = useSelector<RootState, SellerState['status']>(
    selectProductsStatus
  );
  const sellerStatus = useSelector<RootState, SellerState['status']>(
    selectSellerStatus
  );
  const isLoading = productsStatus === 'loading' || sellerStatus === 'loading';

  useEffect(() => {
    if (sellerName) {
      dispatch(fetchSellerByNameThunk(sellerName));
    }

    dispatch(fetchProductsThunk());
  }, [dispatch, sellerName]);

  if (isLoading) {
    return <Loader />;
  }

  return (
    <ErrorBoundary>
      <div className="seller-page">
        <SellerHero />
        <SellerProducts />
        <Reviews />
      </div>
    </ErrorBoundary>
  );
};

// export default withNavBar({ wrappedComponent: SellerPage });
export default memo(SellerPage);
