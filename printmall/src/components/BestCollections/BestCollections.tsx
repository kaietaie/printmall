import SectionTitle from '../../common/SectionTitle';
import { useTranslation } from 'react-i18next';
import FilterTabs from '../../common/FilterTabs';
import './BestCollections.sass';

const BestCollections = () => {
  const { t } = useTranslation();

  return (
    <div className="best-collections-head">
      <SectionTitle topSubTitle={t('bestCollections.subTitle')}>
        {t('bestCollections.title')}
      </SectionTitle>
      <FilterTabs />
    </div>
  );
};

export default BestCollections;
