import { memo, useEffect } from 'react';
import SellerHero from '../components/SellerHero';
import SellerProducts from '../components/SellerProducts';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../store/store';
import Loader from '../components/common/Loader';
import { fetchProductsThunk } from '../store/products/productThunks';
import { useParams } from 'react-router-dom';
import { fetchSellerByNameThunk } from '../store/seller/sellerThunks';

const SellerPage = () => {
  const { sellerName } = useParams<{ sellerName: string }>();

  const dispatch = useDispatch<AppDispatch>();

  const productsStatus = useSelector(
    (state: RootState) => state.products.status
  );
  const sellerStatus = useSelector((state: RootState) => state.seller.status);

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
    <>
      <SellerHero />
      <SellerProducts />
    </>
  );
};

// export default withNavBar({ wrappedComponent: SellerPage });
export default memo(SellerPage);
