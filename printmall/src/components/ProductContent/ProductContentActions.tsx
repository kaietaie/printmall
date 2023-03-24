import React, { memo, useState } from 'react';
import Button from '../common/Buttons';
import { ReactComponent as SupportIcon } from '../images/support-agent.svg';
import { ReactComponent as BasketIcon } from '../images/shopping-basket.svg';
import { useTranslation } from 'react-i18next';
import SupportModal from '../common/SupportModal/SupportModal';

interface ProductContentActionsProps {
  onClick: () => void;
}

const ProductContentActions: React.FC<ProductContentActionsProps> = ({
  onClick,
}) => {
  const { t } = useTranslation();
  const [isOpenModal, setOpenIsModal] = useState(false);

  const handleToggleModal = () => {
    setOpenIsModal(!isOpenModal);
  };

  return (
    <div className="product-content-actions">
      <Button
        className="product-content-actions-button"
        onClick={onClick}
        iconEnd={<BasketIcon />}
      >
        {t('product.cartButton')}
      </Button>
      <div className="product-content-support">
        <SupportIcon />
        <span className="product-content-support-text">
          {t('product.supportText')}
        </span>
        <button
          onClick={handleToggleModal}
          className="product-content-support-button"
        >
          {t('product.supportLink')}
        </button>
      </div>
      {isOpenModal && <SupportModal onClose={handleToggleModal} />}
    </div>
  );
};

export default memo(ProductContentActions);
