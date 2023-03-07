import React, { memo, useEffect } from 'react';
import SectionTitle from '../common/SectionTitle';
import { useTranslation } from 'react-i18next';
import FilterTabs from '../common/FilterTabs';
import ProductCard from '../common/ProductCard';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import Button from '../common/Button';
import { useDispatch, useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { Product } from '../../types/Products';
import { fetchProductsThunk } from '../../store/products/productThunks';
import './BestCollections.sass';

const BestCollections = () => {
  const dispatch = useDispatch();
  const { t } = useTranslation();
  const products = useSelector<RootState, Product[]>(
    (state) => state.products.items
  );

  useEffect(() => {
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-ignore
    dispatch(fetchProductsThunk({ limit: 4, page: 1 }));
  }, [dispatch]);

  return (
    <>
      <div className="best-collections-head">
        <SectionTitle topSubTitle={t('bestCollections.subTitle')}>
          {t('bestCollections.title')}
        </SectionTitle>
        <FilterTabs />
      </div>
      <div className="best-collections-cards">
        {products.map((product) => {
          return <ProductCard key={product.product_id} product={product} />;
        })}
      </div>
      <Button
        className="best-collections-discover-button"
        iconEnd={<ArrowForward />}
        type="secondary"
      >
        Discover more
      </Button>
    </>
  );
};

export default memo(BestCollections);
