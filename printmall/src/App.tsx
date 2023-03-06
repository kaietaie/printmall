import React from 'react';
import Header from './components/Header';
import { Route, Routes, BrowserRouter } from 'react-router-dom';
import Home from './Pages/Home';
import Seller from './Pages/Seller';
import './App.sass';

function App() {
  return (
    <BrowserRouter>
      <Header />
      <div className="container">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/:sellerName" element={<Seller />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;
