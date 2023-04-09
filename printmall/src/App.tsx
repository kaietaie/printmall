import React, { memo } from 'react';
import { PayPalScriptProvider } from '@paypal/react-paypal-js';
import { ToastContainer } from 'react-toastify';
import { Route, Routes, BrowserRouter } from 'react-router-dom';
import SellerPage from './Pages/SellerPage';
import ProductPage from './Pages/ProductPage';
import CartPage from './Pages/CartPage';
import PaymentPage from './Pages/PaymentPage';
import CheckPaymentPage from './Pages/CheckPaymentPage';
import TemporaryHomePage from './Pages/TemporaryHomePage';
import CompletePage from './Pages/CompletePage';
import CheckoutPage from './Pages/CheckoutPage';
import PrivacyPage from './Pages/PrivacyPage';
import MainLayout from './components/MainLayout';
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
        <MainLayout>
          <Routes>
            {/*<Route path="/" element={<HomePage />} />*/}
            <Route path="/" element={<TemporaryHomePage />} />
            <Route path="/seller/:sellerName" element={<SellerPage />} />
            <Route path="/products/:productId" element={<ProductPage />} />
            <Route path="/cart" element={<CartPage />} />
            <Route path="/checkout" element={<CheckoutPage />} />
            <Route path="/payment" element={<PaymentPage />} />
            <Route path="/checkpayment" element={<CheckPaymentPage />} />
            <Route path="/complete" element={<CompletePage />} />
            <Route path="/policy" element={<PrivacyPage />} />
          </Routes>
        </MainLayout>
      </BrowserRouter>
    </PayPalScriptProvider>
  );
}

export default memo(App);
