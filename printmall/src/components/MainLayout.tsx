import React, { memo } from 'react';
import { useLocation } from 'react-router-dom';
import Header from './Header/Header';
import Footer from './Footer';

const MainLayout: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const location = useLocation();
  const showFooter =
    location.pathname === '/' ||
    location.pathname.includes('/seller/') ||
    location.pathname.includes('/products/');

  // useEffect(() => {
  //   // Add any code that needs to be executed when the location changes
  // }, [location]);

  return (
    <>
      <Header />
      <div className="container">{children}</div>
      {showFooter && <Footer />}
    </>
  );
};

export default memo(MainLayout);
