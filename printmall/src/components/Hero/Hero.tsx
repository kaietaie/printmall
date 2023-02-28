import '../../i18n/config';
import { useTranslation } from 'react-i18next';
const Hero = () => {
  const { t } = useTranslation();
  return (
    <div>
      <p>{t('hero.subTitle')}</p>
    </div>
  );
};

export default Hero;
