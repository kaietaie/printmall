import React, { memo } from 'react';
import Rating from '@mui/material/Rating';

interface ReviewCardProps {
  rating_value: number;
  message: string;
  imageSrc: string;
  name: string;
  address: string;
}

const ReviewCard: React.FC<ReviewCardProps> = ({
  rating_value,
  address,
  name,
  message,
  imageSrc,
}) => {
  return (
    <div className="review-card">
      <Rating readOnly value={rating_value} />
      <p className="review-card-message">{message}</p>
      <div className="review-card-author">
        <img src={imageSrc} alt="avatar" />
        <div className="review-card-author-info">
          <span className="review-card-author-name">{name}</span>
          <span className="review-card-author-address">{address}</span>
        </div>
      </div>
    </div>
  );
};

export default memo(ReviewCard);
