import { memo, useEffect } from 'react';
import ProductContent from '../components/ProductContent';
import { fetchProductByIdThunk } from '../store/products/productThunks';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../store/store';
import Loader from '../components/common/Loader';
import ErrorBanner from '../components/common/ErrorBanner';

const ProductPage = () => {
  const { productId } = useParams<{ productId: string }>();
  const dispatch = useDispatch<AppDispatch>();
  const status = useSelector((state: RootState) => state.product.status);
  const isLoading = status === 'loading';
  const isError = status === 'failed';

  useEffect(() => {
    if (productId) {
      dispatch(fetchProductByIdThunk(Number(productId)));
    }
  }, [dispatch, productId]);

  if (isLoading) {
    return <Loader />;
  }

  if (isError) {
    return <ErrorBanner />;
  }

  return <ProductContent />;
};

// export default memo(withNavBar({ wrappedComponent: ProductPage }));
export default memo(ProductPage);
