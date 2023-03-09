import React from 'react';
import Header from './components/Header';
import { Route, Routes, BrowserRouter } from 'react-router-dom';
import HomePage from './Pages/HomePage';
import SellerPage from './Pages/SellerPage';
import ProductPage from './Pages/ProductPage';
import './App.sass';

function App() {
  return (
    <BrowserRouter>
      <Header />
      <div className="container">
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/seller/:sellerName" element={<SellerPage />} />
          <Route path="/products/:productId" element={<ProductPage />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;
