import React, { memo } from 'react';
import Modal from '@mui/material/Modal';
import CloseButton from '../Buttons/CloseButton';
import Form from '../Form';
import { useTranslation } from 'react-i18next';

import './SupportModal.sass';

interface SupportModalProps {
  onClose: () => void;
}

const SupportModal: React.FC<SupportModalProps> = ({ onClose }) => {
  const { t } = useTranslation();

  return (
    <Modal
      open
      onClose={onClose}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <div className="support-modal">
        <CloseButton className="support-modal-close-button" onClick={onClose} />
        <span className="support-modal-subtitle">
          {t('supportModal.subTitle')}
        </span>
        <h1 className="support-modal-title">{t('supportModal.title')}</h1>
        <span className="support-modal-message">
          {t('supportModal.message')}
        </span>
        <Form onClose={onClose} />
      </div>
    </Modal>
  );
};

export default memo(SupportModal);
