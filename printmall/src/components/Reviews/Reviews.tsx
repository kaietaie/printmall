import ReviewsTopSection from './ReviewsTopSection';
import ReviewCard from './ReviewCard';
import redAva from './images/red_reviewer.png';
import greenAva from './images/green_reviewer.png';
import darkGreenAva from './images/dark_green_reviewer.png';
import purpleAva from './images/purple_reviwer.png';

import './Reviews.sass';

const mockReviewsData = [
  {
    rating_value: 5,
    message:
      'I never thought online shopping could be so fun! Thanks to KRAM, I can now buy all the things I need without leaving my den',
    imageSrc: redAva,
    name: 'Furry the Fox',
    address: 'Poland, Krakow',
  },
  {
    rating_value: 5,
    message:
      'KRAM is the bamboo to my appetite for online shopping! Fast delivery, excellent customer service, and the cutest products.',
    imageSrc: darkGreenAva,
    name: 'Polly the Panda',
    address: 'Lviv, Ukraine',
  },
  {
    rating_value: 5,
    message:
      'Hop hop hooray for KRAM! I was a little hesitant to buy online, but KRAM made it so easy and enjoyable. Carrots never tasted so good!',
    imageSrc: greenAva,
    name: 'Benny the Bunny',
    address: 'Berlin, Germany',
  },
  {
    rating_value: 5,
    message:
      "I usually take my time to make decisions, but with KRAM, I don't have to! Their products are just what I need, and the delivery is so fast, I don't even have to leave my tree.",
    imageSrc: purpleAva,
    name: 'Sammy the Sloth',
    address: 'Riga, Latvia',
  },
];

const Reviews = () => {
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

export default Reviews;
