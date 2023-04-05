import { memo, useState } from 'react';
import SectionTitle from '../common/SectionTitle';
import Button from '../common/Buttons';
import SupportModal from '../common/SupportModal/SupportModal';
import { ReactComponent as PlusIcon } from '../images/plus_icon.svg';
import { useTranslation } from 'react-i18next';

const ReviewsTopSection = () => {
  const { t } = useTranslation();
  const [isOpenModal, setOpenIsModal] = useState(false);

  const handleToggleModal = () => {
    setOpenIsModal(!isOpenModal);
  };

  return (
    <div className="reviews-top-section">
      <SectionTitle topSubTitle={t('reviews.subTitle')}>
        {t('reviews.title')}
      </SectionTitle>
      <Button
        className="reviews-top-section-button"
        onClick={handleToggleModal}
        iconEnd={<PlusIcon />}
        type="secondary"
      >
        {t('reviews.addReviewButton')}
      </Button>
      {isOpenModal && <SupportModal onClose={handleToggleModal} />}
    </div>
  );
};

export default memo(ReviewsTopSection);
