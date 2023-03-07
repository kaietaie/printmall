import { useDispatch, useSelector } from 'react-redux';
import { RootState } from '../../store/store';
import { Product } from '../../types/Products';
import React, { useEffect } from 'react';
import { fetchProductsThunk } from '../../store/products/productThunks';
import ProductCard from '../common/ProductCard/ProductCard';
import './SellerProducts.sass';

const SellerProducts = () => {
  const dispatch = useDispatch();
  const products = useSelector<RootState, Product[]>(
    (state) => state.products.items
  );
  useEffect(() => {
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-ignore
    dispatch(fetchProductsThunk());
  }, [dispatch]);

  return (
    <div className="seller-products-cards">
      {products.map((product) => {
        return <ProductCard key={product.product_id} product={product} />;
      })}
    </div>
  );
};

export default SellerProducts;
