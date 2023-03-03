import SectionTitle from '../../common/SectionTitle';
import { useTranslation } from 'react-i18next';

const BestCollections = () => {
  const { t } = useTranslation();

  return (
    <SectionTitle topSubTitle={t('bestCollections.subTitle')}>
      {t('bestCollections.title')}
    </SectionTitle>
  );
};

export default BestCollections;
