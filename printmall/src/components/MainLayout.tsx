import React, { memo, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import Header from './Header/Header';
import Footer from './Footer';

const MainLayout: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const { pathname } = useLocation();
  const showFooter =
    // pathname === '/' ||
    pathname.includes('/seller/') ||
    pathname.includes('/products/') ||
    pathname.includes('/policy');

  const showHeader = pathname !== '/';

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
