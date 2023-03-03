import Hero from '../components/Hero';
import withNavBar from '../HOCS/withNavBar';
import BestCollections from '../components/BestCollections';
const Home = () => {
  return (
    <>
      <Hero />
      <BestCollections />
    </>
  );
};

export default withNavBar({ wrappedComponent: Home });
