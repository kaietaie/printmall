import React from 'react';
import SwiperCore, { Navigation, Pagination, Scrollbar } from 'swiper';
import { Swiper, SwiperSlide } from 'swiper/react';
import { Color } from '../../types/Products';
import 'swiper/swiper-bundle.css';
// import 'swiper/css';

// SwiperCore.use([Navigation, Pagination, Scrollbar]);

interface CarouselProps {
  colors: Color[];
  onColorPick: (color: string) => void;
}

const Carousel: React.FC<CarouselProps> = ({ colors, onColorPick }) => {
  const handleSlideChange = (swiper: any) => {
    console.log(swiper.activeIndex);
  };
  return (
    <Swiper
      className="carousel"
      modules={[Navigation, Pagination, Scrollbar]}
      direction="vertical"
      // height={850}
      // width={10}
      grabCursor={true}
      navigation
      // pagination={{ clickable: true }}
      // scrollbar={{ draggable: true }}
      spaceBetween={10}
      slidesPerView={5}
      onSlideChange={handleSlideChange}
      onSwiper={(swiper) => console.log(swiper)}
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
