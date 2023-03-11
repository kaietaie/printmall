import { useEffect, useState } from 'react';

function useScreen(maxWidth = 640) {
  const [screenWidth, setScreenWidth] = useState(document.body.clientWidth);

  useEffect(() => {
    const handleWindowResize = () => {
      setScreenWidth(document.body.clientWidth);
    };

    window.addEventListener('resize', handleWindowResize);

    return () => {
      window.removeEventListener('resize', handleWindowResize);
    };
  });

  const isMobile = () => screenWidth <= maxWidth;

  return {
    screenWidth,
    isMobile,
  };
}

export default useScreen;
