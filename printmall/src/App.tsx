import React from 'react';
import Header from './components/Header';
import { Route, Routes, BrowserRouter } from 'react-router-dom';
import HomePage from './Pages/HomePage';
import SellerPage from './Pages/SellerPage';
import ProductPage from './Pages/ProductPage';
import CartPage from './Pages/CartPage';
import './App.sass';
import CheckoutPage from './Pages/CheckoutPage';

function App() {
  return (
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
  );
}

export default App;
