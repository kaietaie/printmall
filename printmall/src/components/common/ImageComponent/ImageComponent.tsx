import React, { memo, useState } from 'react';

interface ImageComponentProps {
  imageUrl: string | undefined;
  defaultImageUrl: string;
  className?: string;
  alt: string;
}

const ImageComponent: React.FC<ImageComponentProps> = ({
  imageUrl,
  defaultImageUrl,
  className,
  alt,
}) => {
  //todo: find better solution to access server images
  const serverUrl = 'http://localhost:5000';
  const [imgSrc, setImgSrc] = useState(serverUrl + imageUrl);

  const handleImgError = () => {
    setImgSrc(defaultImageUrl);
  };

  return (
    <img
      className={className}
      src={imgSrc}
      onError={handleImgError}
      alt={alt}
    />
  );
};

export default memo(ImageComponent);
