import { createAsyncThunk } from '@reduxjs/toolkit';
import { Seller } from '../../types/Sellers';
import { fetchSellerByName } from '../../api/sellerAPI';

export const fetchSellerByNameThunk = createAsyncThunk<Seller, string>(
  'seller/fetchSellerById',
  async (name: string) => {
    return await fetchSellerByName(name);
  }
);
