import React from 'react';
import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import ProductCard from '../common/ProductCard/ProductCard';
import './SellerProducts.sass';

const SellerProducts = () => {
  const products = useSelector((state: RootState) => state.products.items);

  return (
    <div className="seller-products-cards">
      {products.map((product) => {
        return <ProductCard key={product.product_id} product={product} />;
      })}
    </div>
  );
};

export default SellerProducts;
