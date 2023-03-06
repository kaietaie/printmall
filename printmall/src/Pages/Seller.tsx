import withNavBar from '../HOCS/withNavBar';
import SellerHero from '../components/SellerHero';

const Seller = () => {
  return <SellerHero />;
};
export default withNavBar({ wrappedComponent: Seller });
