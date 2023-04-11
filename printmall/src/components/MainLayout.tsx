import React, { memo, useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import Header from './Header/Header';
import Footer from './Footer';
import { useSelector } from 'react-redux';
import { RootState } from '../store/store';
import { CartState } from '../types/Cart';
import { selectCartTotalQuantity } from '../store/cart/cartSelectors';

const MainLayout: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const { pathname } = useLocation();
  const navigate = useNavigate();
  const cartTotalQuantity = useSelector<
    RootState,
    CartState['cartTotalQuantity']
  >(selectCartTotalQuantity);

  const showFooter =
    // pathname === '/' ||
    pathname.includes('/seller/') ||
    pathname.includes('/products/') ||
    pathname.includes('/policy');

  const showHeader = pathname !== '/';

  const emptyCartForbiddenPage =
    pathname === '/payment' || pathname === '/checkout';

  const isPurchasingPage =
    pathname === '/payment' || pathname === '/checkout' || pathname === '/cart';

  useEffect(() => {
    if (emptyCartForbiddenPage && cartTotalQuantity === 0) {
      navigate(`/seller/Go_A`);
    }
  }, [cartTotalQuantity, emptyCartForbiddenPage, navigate]);

  useEffect(() => {
    if (!isPurchasingPage) return;

    document.body.classList.add('purchasing-page');

    return () => {
      document.body.classList.remove('purchasing-page');
    };
  }, [isPurchasingPage]);

  useEffect(() => {
    window.scrollTo(0, 0);
  }, [pathname]);

  return (
    <>
      {showHeader && <Header />}
      <div className="container">{children}</div>
      {showFooter && <Footer />}
    </>
  );
};

export default memo(MainLayout);
