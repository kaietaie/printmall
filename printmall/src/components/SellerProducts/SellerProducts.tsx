import React from 'react';
import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import ProductCard from '../common/ProductCard/ProductCard';
import './SellerProducts.sass';
import {
  selectProductsItems,
  selectProductsStatus,
} from '../../store/products/productsSelectors';
import { ProductsState } from '../../types/Products';
import ErrorBoundary from '../common/ErrorBoundary';
import { SellerState } from '../../types/Sellers';
import ErrorBannerSmall from '../common/ErrorBanner/ErrorBannerSmall';
import { useTranslation } from 'react-i18next';

const SellerProducts = () => {
  const { t } = useTranslation();
  const products = useSelector<RootState, ProductsState['items']>(
    selectProductsItems
  );
  const productsStatus = useSelector<RootState, SellerState['status']>(
    selectProductsStatus
  );

  const isError = productsStatus === 'failed';

  if (isError) {
    return <ErrorBannerSmall message={t('errorBanner.productMessage')} />;
  }

  return (
    <div className="seller-products-cards">
      {products.map((product) => {
        return <ProductCard key={product.product_id} product={product} />;
      })}
    </div>
  );
};

export default SellerProducts;
