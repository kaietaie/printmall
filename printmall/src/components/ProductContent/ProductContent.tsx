import { Link, useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
// import { selectProductById } from '../../store/products/productSlice';
import { products } from '../../mochs/mProducts';
import './ProductContent.sass';

import { memo, useEffect } from 'react';
import { fetchProductByIdThunk } from '../../store/products/productThunks';

const ProductContent = () => {
  const { productId } = useParams<{ productId: string }>();
  const dispatch = useDispatch();
  // const product = useSelector(selectProductById(Number(productId)));
  const color = products[0].colors[0];
  const product = products[0];

  useEffect(() => {
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-ignore
    dispatch(fetchProductByIdThunk(productId));
  }, [dispatch, productId]);

  return (
    <div className="product-content">
      <img
        className="product-content-image"
        src={color.product_image}
        alt="Product image"
      />
      <div className="product-content-info">
        <h2 className="product-content-info-title">{product.product_name}</h2>
        {/* eslint-disable-next-line react/jsx-no-undef */}
        <Link
          to={`/${product.seller_name.toLowerCase()}`}
          className="product-card-seller-name"
        >
          {product.seller_name}
        </Link>
      </div>
    </div>
  );
};

export default memo(ProductContent);
