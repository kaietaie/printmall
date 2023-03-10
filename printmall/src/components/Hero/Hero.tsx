import React from 'react';
import '../../i18n/config';
import { useTranslation } from 'react-i18next';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import Button from '../common/Buttons';
import firstImage from './images/img1.png';
import secondImage from './images/img2.png';
import thirdImage from './images/img3.png';
import fourthImage from './images/img4.png';
import './Hero.sass';

const Hero: React.FC<unknown> = () => {
  const { t } = useTranslation();

  return (
    <div className="hero">
      <div className="hero-titles">
        <span className="hero-sub-tittle">{t('hero.subTitle')}</span>
        <h1 className="hero-tittle">{t('hero.title')}</h1>
        <Button className="hero-primary-btn" iconEnd={<ArrowForward />}>
          {t('hero.primaryBtn')}
        </Button>
        <Button type="secondary">{t('hero.secondaryBtn')}</Button>
      </div>
      <div className="hero-images">
        <div className="hero-img-container hero-img-container--first">
          <img className="hero-img" alt="hero img" src={firstImage} />
        </div>
        <div className="hero-images-card">
          <p>{t('hero.imageText1')}</p>
          <div className="hero-img-container hero-img-container--second">
            <img className="hero-img" alt="hero img" src={secondImage} />
          </div>
        </div>

        <div className="hero-img-container hero-img-container--third">
          <img className="hero-img" alt="hero img" src={thirdImage} />
        </div>
        <div className="hero-images-card">
          <p>{t('hero.imageText2')}</p>
          <div className="hero-img-container hero-img-container--fourth">
            <img className="hero-img" alt="hero img" src={fourthImage} />
          </div>
        </div>
      </div>
    </div>
  );
};

export default Hero;
