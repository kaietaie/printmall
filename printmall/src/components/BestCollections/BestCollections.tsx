import SectionTitle from '../../common/SectionTitle';
import { useTranslation } from 'react-i18next';
import FilterTabs from '../../common/FilterTabs';
import ProductCard from '../../common/ProductCard';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import tw from './mochImages/tw.png';
import tb from './mochImages/tb.png';
import tg from './mochImages/tg.png';
import tw2 from './mochImages/tw2.png';

import './BestCollections.sass';
import Button from '../../common/Button';
import React from 'react';

const products = [
  {
    id: 1,
    name: 'Bold Statement Graphic Tee',
    colors: [
      { name: 'white', image: tw },
      { name: 'black', image: tb },
      { name: 'green', image: tg },
    ],
    seller: 'Solider',
    rating: 4.8,
    sales: 2310,
    price: 29.99,
  },
  {
    id: 2,
    name: 'Wildlife Adventure T-Shirt',
    colors: [
      { name: 'black', image: tb },
      { name: 'green', image: tg },
      { name: 'white', image: tw },
    ],
    seller: 'Solider',
    rating: 4.8,
    sales: 2310,
    price: 24.99,
  },
  {
    id: 3,
    name: 'Bohemian Style Graphic Tee',
    colors: [
      { name: 'white', image: tw2 },
      { name: 'black', image: tb },
      { name: 'green', image: tg },
    ],
    seller: 'Solider',
    rating: 4.8,
    sales: 2310,
    price: 24.99,
  },
  {
    id: 4,
    name: 'Floral Burst Tank Top',
    colors: [
      { name: 'green', image: tg },
      { name: 'white', image: tw2 },
      { name: 'black', image: tb },
    ],
    seller: 'Solider',
    rating: 4.8,
    sales: 2310,
    price: 24.99,
  },
];

const BestCollections = () => {
  const { t } = useTranslation();

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
          return <ProductCard key={product.id} product={product} />;
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
