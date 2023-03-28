import { memo, useEffect } from 'react';
import { fetchProductByIdThunk } from '../store/products/productThunks';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../store/store';
import Loader from '../components/common/Loader';
import ProductContent from '../components/ProductContent';
import ProductDescription from '../components/ProductDescription/ProductDescription';
import ErrorBanner from '../components/common/ErrorBanner';
import { selectProductStatus } from '../store/products/productsSelectors';
import { ProductState } from '../types/Product';

const ProductPage = () => {
  const { productId } = useParams<{ productId: string }>();
  const dispatch = useDispatch<AppDispatch>();
  const status = useSelector<RootState, ProductState['status']>(
    selectProductStatus
  );
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

  return (
    <>
      <ProductContent />
      <ProductDescription />
    </>
  );
};

// export default memo(withNavBar({ wrappedComponent: ProductPage }));
export default memo(ProductPage);
