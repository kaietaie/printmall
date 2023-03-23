import React, { memo } from 'react';
import { PayPalScriptProvider } from '@paypal/react-paypal-js';
import { ToastContainer } from 'react-toastify';
import { Route, Routes, BrowserRouter } from 'react-router-dom';
import Header from './components/Header';
import HomePage from './Pages/HomePage';
import SellerPage from './Pages/SellerPage';
import ProductPage from './Pages/ProductPage';
import CartPage from './Pages/CartPage';
import PaymentPage from './Pages/PaymentPage';
import CompletePage from './Pages/CompletePage';
import 'react-toastify/dist/ReactToastify.css';

import './App.sass';

function App() {
  return (
    <PayPalScriptProvider
      options={{
        'client-id': process.env.REACT_APP_PAYPAL_CLIENT_ID || '',
        currency: 'EUR',
      }}
    >
      <BrowserRouter>
        <ToastContainer />
        <Header />
        <div className="container">
          <Routes>
            <Route path="/" element={<HomePage />} />
            <Route path="/seller/:sellerName" element={<SellerPage />} />
            <Route path="/products/:productId" element={<ProductPage />} />
            <Route path="/cart" element={<CartPage />} />
            <Route path="/payment" element={<PaymentPage />} />
            <Route path="/complete" element={<CompletePage />} />
          </Routes>
        </div>
      </BrowserRouter>
    </PayPalScriptProvider>
  );
}

export default memo(App);
