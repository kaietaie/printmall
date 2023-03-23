import React, { memo } from 'react';
import Modal from '@mui/material/Modal';
import CloseButton from '../Buttons/CloseButton';
import SupportForm from './SupportForm';

import './SupportModal.sass';

interface SupportModalProps {
  onClose: () => void;
}

const SupportModal: React.FC<SupportModalProps> = ({ onClose }) => {
  return (
    <Modal
      open
      onClose={onClose}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <div className="support-modal">
        <CloseButton className="support-modal-close-button" onClick={onClose} />
        <span className="support-modal-subtitle">Contact us</span>
        <h1 className="support-modal-title">Get in touch</h1>
        <span className="support-modal-message">
          We’d love to hear from you. Please fill out this form.
        </span>
        <SupportForm />
      </div>
    </Modal>
  );
};

export default memo(SupportModal);
