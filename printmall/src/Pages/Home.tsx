import Hero from '../components/Hero';
import withNavBar from '../HOCS/withNavBar';
import BestCollections from '../components/BestCollections';
import { memo } from 'react';

const Home = () => {
  return (
    <>
      <Hero />
      <BestCollections />
    </>
  );
};

export default memo(withNavBar({ wrappedComponent: Home }));
