import React, { memo } from 'react';
import { useLocation } from 'react-router-dom';
import Header from './Header/Header';
import Footer from './Footer';

const MainLayout: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const { pathname } = useLocation();
  const showFooter =
    pathname === '/' ||
    pathname.includes('/seller/') ||
    pathname.includes('/products/') ||
    pathname.includes('/privacy');

  // useEffect(() => {
  //   // Add any code that needs to be executed when the location changes
  // }, [location]);

  return (
    <>
      <Header />
      <div className="container container-main">{children}</div>
      {showFooter && <Footer />}
    </>
  );
};

export default memo(MainLayout);
