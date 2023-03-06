import React from 'react';
import SectionTitle from '../../common/SectionTitle';
import { useTranslation } from 'react-i18next';
import FilterTabs from '../../common/FilterTabs';
import ProductCard from '../../common/ProductCard';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import Button from '../../common/Button';
import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { Product } from '../../types/Products';
import './BestCollections.sass';

const BestCollections = () => {
  const { t } = useTranslation();
  const products = useSelector<RootState, Product[]>(
    (state) => state.products.items
  );

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

export default BestCollections;
