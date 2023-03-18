import React, { memo } from 'react';
import { PayPalScriptProvider } from '@paypal/react-paypal-js';
import Header from './components/Header';
import { Route, Routes, BrowserRouter } from 'react-router-dom';
import HomePage from './Pages/HomePage';
import SellerPage from './Pages/SellerPage';
import ProductPage from './Pages/ProductPage';
import CartPage from './Pages/CartPage';
import CheckoutPage from './Pages/CheckoutPage';
// import dotenv from 'dotenv';
// dotenv.config();
// eslint-disable-next-line @typescript-eslint/no-var-requires
// require('dotenv').config();
import { useSelector } from 'react-redux';
import { RootState } from './store/store';
import { CartState } from './types/Cart';
import { selectClientToken } from './store/cart/cartSelectors';

import './App.sass';

function App() {
  const clientToken = useSelector<RootState, CartState['clientToken']>(
    selectClientToken
  );

  return (
    <PayPalScriptProvider
      options={{
        'client-id': process.env.REACT_APP_PAYPAL_CLIENT_ID || '',
        currency:"EUR",
      }}
    >
      <BrowserRouter>
        <Header />
        <div className="container">
          <Routes>
            <Route path="/" element={<HomePage />} />
            <Route path="/seller/:sellerName" element={<SellerPage />} />
            <Route path="/products/:productId" element={<ProductPage />} />
            <Route path="/cart" element={<CartPage />} />
            <Route path="/checkout" element={<CheckoutPage />} />
          </Routes>
        </div>
      </BrowserRouter>
    </PayPalScriptProvider>
  );
}

export default memo(App);
