import { useState } from 'react';
import SectionTitle from '../common/SectionTitle';
import Button from '../common/Buttons';
import SupportModal from '../common/SupportModal/SupportModal';
import { ReactComponent as PlusIcon } from '../images/plus_icon.svg';

const ReviewsTopSection = () => {
  const [isOpenModal, setOpenIsModal] = useState(false);

  const handleToggleModal = () => {
    setOpenIsModal(!isOpenModal);
  };

  return (
    <div className="reviews-top-section">
      <SectionTitle topSubTitle="Reviews">
        What Our Valuable Clients Say About Us
      </SectionTitle>
      <Button
        className="reviews-top-section-button"
        onClick={handleToggleModal}
        iconEnd={<PlusIcon />}
        type="secondary"
      >
        Add review
      </Button>
      {isOpenModal && <SupportModal onClose={handleToggleModal} />}
    </div>
  );
};

export default ReviewsTopSection;
