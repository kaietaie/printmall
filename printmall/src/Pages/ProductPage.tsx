import { memo } from 'react';
import ProductContent from '../components/ProductContent';

const ProductPage = () => {
  return <ProductContent />;
};

// export default memo(withNavBar({ wrappedComponent: ProductPage }));
export default memo(ProductPage);
