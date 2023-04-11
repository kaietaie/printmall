import React, { memo, useEffect, useState } from 'react';
import { BACKEND_URL } from '../../../api/constants';

interface ImageComponentProps {
  imageUrl: string | undefined;
  defaultImageUrl: string;
  className?: string;
  alt: string;
  onClick?: () => void;
}

const ImageComponent: React.FC<ImageComponentProps> = ({
  imageUrl,
  defaultImageUrl,
  className,
  alt,
  onClick,
}) => {
  //todo: find better solution to access server images
  const withServerUrl = BACKEND_URL + imageUrl;
  const [imgSrc, setImgSrc] = useState(withServerUrl);

  useEffect(() => {
    if (imageUrl) {
      setImgSrc(withServerUrl);
    }
  }, [imageUrl, withServerUrl]);

  const handleImgError = () => {
    setImgSrc(defaultImageUrl);
  };

  return (
    <img
      className={className}
      onClick={onClick}
      src={imgSrc}
      onError={handleImgError}
      alt={alt}
    />
  );
};

export default memo(ImageComponent);
