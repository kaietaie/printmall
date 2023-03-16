export interface Seller {
  seller_name: string;
  seller_photo: string;
  seller_cover_image: string;
  seller_announcement: string;
}

export interface SellerState {
  seller: Seller | null;
  status: 'idle' | 'loading' | 'succeeded' | 'failed';
  error: string | null;
}
