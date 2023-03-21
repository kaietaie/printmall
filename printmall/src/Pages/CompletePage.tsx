import PurchaseStatus from '../components/common/PurchaseStatus';
import ReturnButton from '../components/common/Buttons/ReturnButton';
import CompleteContent from '../components/CompleteContent';

const CompletePage = () => {
  return (
    <div className="complete-page">
      <ReturnButton />
      <PurchaseStatus currentStep="complete" />
      <CompleteContent />
    </div>
  );
};

export default CompletePage;
