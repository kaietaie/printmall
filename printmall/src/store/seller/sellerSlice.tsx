import { createSlice } from '@reduxjs/toolkit';
import { Seller } from '../../types/Sellers';
import { fetchSellerByNameThunk } from './sellerThunks';

interface SellerState {
  seller: Seller | null;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}

const initialState: SellerState = {
  seller: null,
  status: 'idle',
  error: null,
};

const sellerSlice = createSlice({
  name: 'seller',
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchSellerByNameThunk.pending, (state) => {
        state.status = 'loading';
      })
      .addCase(fetchSellerByNameThunk.fulfilled, (state, action) => {
        state.seller = action.payload;
        state.status = 'succeeded';
        state.error = null;
      })
      .addCase(fetchSellerByNameThunk.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message ?? 'Error fetching seller';
      });
  },
});

export const selectSellerByName =
  (sellerName: string) => (state: { seller: SellerState }) =>
    state.seller.seller && state.seller.seller.seller_name === sellerName
      ? state.seller.seller
      : null;

export default sellerSlice.reducer;
