import React from 'react';
import { Navigation, Pagination, Scrollbar } from 'swiper';
import { Swiper, SwiperSlide } from 'swiper/react';
import { Color } from '../../types/Products';
import useScreen from '../hooks/useScreen';
import ImageComponent from '../common/ImageComponent';
import defaultProductImage from '../images/defaultImages/product_default.png';
import 'swiper/swiper-bundle.css';

interface CarouselProps {
  colors: Color[];
  onColorPick: (color: string) => void;
}

const Carousel: React.FC<CarouselProps> = ({ colors, onColorPick }) => {
  const { isMobile } = useScreen(639);
  const isVertical = isMobile() ? 'horizontal' : 'vertical';
  const previewQuantity = isMobile() ? 3 : 5;
  return (
    <Swiper
      className="carousel"
      modules={[Navigation, Pagination, Scrollbar]}
      direction={isVertical}
      grabCursor={true}
      navigation
      spaceBetween={10}
      slidesPerView={previewQuantity}
    >
      {colors.map(({ product_image, color }, index) => (
        <SwiperSlide key={index}>
          <ImageComponent
            className="carousel-image"
            alt="product slide"
            defaultImageUrl={defaultProductImage}
            imageUrl={product_image}
            onClick={() => onColorPick(color)}
          />
        </SwiperSlide>
      ))}
    </Swiper>
  );
};

export default Carousel;
