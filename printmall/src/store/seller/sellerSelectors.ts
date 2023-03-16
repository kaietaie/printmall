import { RootState } from '../store';

export const selectSellerStatus = (state: RootState) => state.seller.status;

export const selectSeller = (state: RootState) => state.seller.seller;
