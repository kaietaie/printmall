import { RootState } from '../store';

export const selectProduct = (state: RootState) => state.product.product;

export const selectProductsStatus = (state: RootState) => state.products.status;

export const selectProductsItems = (state: RootState) => state.products.items;

export const selectProductStatus = (state: RootState) => state.product.status;
