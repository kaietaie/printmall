import '../../i18n/config';
import { useTranslation } from 'react-i18next';
import { ReactComponent as ArrowForward } from '../images/arrow_forward.svg';
import Button from '../../common/Button';
import './Hero.sass';

const Hero = () => {
  const { t } = useTranslation();
  return (
    <div className="hero">
      <span className="hero-sub-tittle">{t('hero.subTitle')}</span>
      <h1 className="hero-tittle">{t('hero.title')}</h1>
      <Button className="hero-primary-btn" icon={<ArrowForward />}>
        {t('hero.primaryBtn')}
      </Button>
      <Button type="secondary">{t('hero.secondaryBtn')}</Button>
    </div>
  );
};

export default Hero;
