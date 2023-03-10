import { Product } from '../types/Products';
import tw from '../components/BestCollections/mochImages/tw.png';
import tb from '../components/BestCollections/mochImages/tb.png';
import tg from '../components/BestCollections/mochImages/tg.png';
import tw2 from '../components/BestCollections/mochImages/tw2.png';

export const products: Product[] = [
  {
    product_id: 1,
    product_name: 'Bold Statement Graphic Tee',
    colors: [
      { color: 'white', product_image: tw },
      { color: 'black', product_image: tb },
      { color: 'green', product_image: tg },
    ],
    product_size: ['L', 'XL'],
    product_description: 'adsf',
    seller_name: 'Solider',
    seller_sales: 2310,
    product_price: 29.99,
    seller_rating: 4.8,
  },
  {
    product_id: 2,
    product_name: 'Wildlife Adventure T-Shirt',
    colors: [
      { color: 'black', product_image: tb },
      { color: 'green', product_image: tg },
      { color: 'white', product_image: tw },
    ],
    product_size: ['L', 'XL'],
    product_description: 'adsf',
    seller_name: 'Solider',
    seller_sales: 2310,
    product_price: 24.99,
    seller_rating: 4.8,
  },
  {
    product_id: 3,
    product_name: 'Bohemian Style Graphic Tee',
    colors: [
      { color: 'white', product_image: tw2 },
      { color: 'black', product_image: tb },
      { color: 'green', product_image: tg },
    ],
    product_size: ['L', 'XL'],
    product_description: 'adsf',
    seller_name: 'Solider',
    seller_sales: 2310,
    product_price: 24.99,
    seller_rating: 4.8,
  },
  {
    product_id: 4,
    product_name: 'Floral Burst Tank Top',
    colors: [
      { color: 'green', product_image: tg },
      { color: 'white', product_image: tw2 },
      { color: 'black', product_image: tb },
    ],
    product_size: ['L', 'XL'],
    product_description: 'adsf',
    seller_name: 'Solider',
    seller_sales: 2310,
    product_price: 24.99,
    seller_rating: 4.8,
  },
];
