import React from 'react';
import SwiperCore, { Navigation, Pagination, Scrollbar } from 'swiper';
import { Swiper, SwiperSlide } from 'swiper/react';
import { Color } from '../../types/Products';
import 'swiper/swiper-bundle.css';
import useScreen from '../hooks/useScreen';
// import 'swiper/css';

// SwiperCore.use([Navigation, Pagination, Scrollbar]);

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
      {colors.map((color, index) => (
        <SwiperSlide key={index}>
          <img
            className="carousel-image"
            onClick={() => onColorPick(color.color)}
            src={'http://localhost:5000' + color.product_image}
            alt={`Slide ${index}`}
          />
        </SwiperSlide>
      ))}
    </Swiper>
  );
  // const [selectedImageIndex, setSelectedImageIndex] = React.useState(0);
  //
  // const handleSlideChange = (swiper: any) => {
  //   setSelectedImageIndex(swiper.activeIndex);
  // };
  //
  // return (
  //   <div className="carousel">
  //     <Swiper
  //       direction="vertical"
  //       spaceBetween={10}
  //       slidesPerView={5}
  //       onSlideChange={handleSlideChange}
  //       navigation
  //       pagination={{ clickable: true }}
  //     >
  //       {colors.map((color, index) => (
  //         <SwiperSlide key={index}>
  //           <img
  //             src={'http://localhost:5000' + color.product_image}
  //             alt={`Slide ${index}`}
  //           />
  //         </SwiperSlide>
  //       ))}
  //     </Swiper>
  //     <div className="selected-image">
  //       <img
  //         src={
  //           'http://localhost:5000' + colors[selectedImageIndex].product_image
  //         }
  //         alt={`Selected Slide ${selectedImageIndex}`}
  //       />
  //     </div>
  //   </div>
  // );
};

export default Carousel;
