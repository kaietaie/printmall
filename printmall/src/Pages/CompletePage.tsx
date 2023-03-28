import PurchaseStatus from '../components/common/PurchaseStatus';
import CompleteContent from '../components/CompleteContent';

const CompletePage = () => {
  return (
    <div className="complete-page">
      <PurchaseStatus currentStep="complete" />
      <CompleteContent />
    </div>
  );
};

export default CompletePage;
