import { memo } from 'react';
import ReviewsTopSection from './ReviewsTopSection';
import ReviewCard from './ReviewCard';
import redAva from './images/red_reviewer.png';
import greenAva from './images/green_reviewer.png';
import darkGreenAva from './images/dark_green_reviewer.png';
import purpleAva from './images/purple_reviwer.png';
import { useTranslation } from 'react-i18next';

import './Reviews.sass';

const Reviews = () => {
  const { t } = useTranslation();

  const mockReviewsData = [
    {
      rating_value: 5,
      message: t('reviews.redMessage'),
      imageSrc: redAva,
      name: t('reviews.redName'),
      address: t('reviews.redAddress'),
    },
    {
      rating_value: 5,
      message: t('reviews.darkGreenMessage'),
      imageSrc: darkGreenAva,
      name: t('reviews.darkGreenName'),
      address: t('reviews.darkGreenAddress'),
    },
    {
      rating_value: 5,
      message: t('reviews.greenMessage'),
      imageSrc: greenAva,
      name: t('reviews.greenName'),
      address: t('reviews.greenAddress'),
    },
    {
      rating_value: 5,
      message: t('reviews.purpleMessage'),
      imageSrc: purpleAva,
      name: t('reviews.purpleName'),
      address: t('reviews.purpleAddress'),
    },
  ];

  return (
    <div>
      <ReviewsTopSection />
      <div className="reviews-grid">
        {mockReviewsData.map((item) => (
          <ReviewCard
            key={item.name}
            name={item.name}
            rating_value={item.rating_value}
            address={item.address}
            imageSrc={item.imageSrc}
            message={item.message}
          />
        ))}
      </div>
    </div>
  );
};

export default memo(Reviews);
