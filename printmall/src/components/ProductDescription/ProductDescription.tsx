import { memo } from 'react';
import FilterTabs from '../common/FilterTabs';

import './ProductDescription.sass';

const filterTitles = ['Shipping & Payment'];

const ProductDescription = () => {
  return (
    <div className="product-description">
      <FilterTabs filterTitles={filterTitles} />
      <p className="product-description-text">
        Lorem ipsum dolor sit amet consectetur. Etiam in integer est eu vitae
        augue metus urna sagittis. Ridiculus sed pellentesque tempor hac
        condimentum eleifend. Scelerisque pellentesque cum amet viverra tempus
        enim arcu adipiscing. Arcu felis id tellus aliquet nulla sit sodales. Ut
        scelerisque sit odio libero fringilla phasellus. Fermentum non lacus
        morbi sit ultrices suspendisse feugiat. Consequat mi diam pulvinar odio
        nisl. Interdum sed mi fermentum ut commodo aliquam tristique eu. Elit
        hendrerit nec a adipiscing. Netus nisl neque semper cursus. Nec
        ullamcorper amet lectus vitae in leo. Sit vitae diam vel tortor
        tristique. Enim tellus adipiscing in volutpat volutpat turpis. Nunc
        pulvinar quis quis in urna urna tellus. Quis semper sit nisl orci sed
        elit dignissim. Sapien leo nisl id pharetra amet. Volutpat mi mauris
        senectus viverra. Pharetra bibendum proin quis iaculis ut leo accumsan
        imperdiet dis.
      </p>
    </div>
  );
};

export default memo(ProductDescription);
