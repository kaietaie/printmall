import withNavBar from '../HOCS/withNavBar';
import SellerHero from '../components/SellerHero';
import SellerProducts from '../components/SellerProducts';

const SellerPage = () => {
  return (
    <>
      <SellerHero />
      <SellerProducts />
    </>
  );
};
export default withNavBar({ wrappedComponent: SellerPage });
