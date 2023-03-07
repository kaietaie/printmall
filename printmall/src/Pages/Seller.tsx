import withNavBar from '../HOCS/withNavBar';
import SellerHero from '../components/SellerHero';
import SellerProducts from '../components/SellerProducts';

const Seller = () => {
  return (
    <>
      <SellerHero />
      <SellerProducts />
    </>
  );
};
export default withNavBar({ wrappedComponent: Seller });
