import PurchaseStatus from '../components/common/PurchaseStatus';
import ReturnButton from '../components/common/Buttons/ReturnButton';

const CompletePage = () => {
  return (
    <div className="complete-page">
      <ReturnButton />
      <PurchaseStatus currentStep="complete" />
    </div>
  );
};

export default CompletePage;
