import { memo } from 'react';
import ProductContent from '../components/ProductContent';
import withNavBar from '../HOCS/withNavBar';

const ProductPage = () => {
  return <ProductContent />;
};

export default memo(withNavBar({ wrappedComponent: ProductPage }));
