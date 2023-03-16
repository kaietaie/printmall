import React from 'react';
import { useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import ProductCard from '../common/ProductCard/ProductCard';
import './SellerProducts.sass';
import { selectProductsItems } from '../../store/products/productsSelectors';
import { ProductsState } from '../../types/Products';

const SellerProducts = () => {
  const products = useSelector<RootState, ProductsState['items']>(
    selectProductsItems
  );

  return (
    <div className="seller-products-cards">
      {products.map((product) => {
        return <ProductCard key={product.product_id} product={product} />;
      })}
    </div>
  );
};

export default SellerProducts;
