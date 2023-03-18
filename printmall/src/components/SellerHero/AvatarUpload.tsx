import { useState } from 'react';
import defaultAvatar from '../images/defaultImages/avatar_big.png';
import Modal from '@mui/material/Modal';
import Box from '@mui/material/Box';
import Avatar from 'react-avatar-edit';
import Button from '../common/Buttons';

const style = {
  position: 'absolute' as const,
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  minWidth: 400,
  bgcolor: 'background.paper',
  border: '2px solid #000',
  boxShadow: 24,
  p: 4,
};

const AvatarUpload = () => {
  const [open, setOpen] = useState(false);
  const [src, setSrc] = useState('');
  const [preview, setPreview] = useState('');

  const handleClose = () => {
    setPreview('');
  };

  const handleCrop = (preview: string) => {
    setPreview(preview);
  };

  const handleSave = () => {
    setSrc(preview);
    localStorage.setItem('avatar', preview);
    handleCloseModal();
  };

  const handleOpenModal = () => setOpen(true);

  const handleCloseModal = () => {
    setPreview('');
    setOpen(false);
  };

  return (
    <>
      <Modal
        open={open}
        onClose={handleCloseModal}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box sx={style}>
          <Avatar
            width={400}
            height={300}
            onCrop={handleCrop}
            onClose={handleClose}
            src={src}
          />
          <Button
            className="avatar-upload-modal-button"
            type="secondary"
            onClick={handleSave}
          >
            Save
          </Button>
        </Box>
      </Modal>
      <div className="avatar-upload-container">
        <img
          className="avatar-upload-image"
          src={localStorage.getItem('avatar') || defaultAvatar}
          alt="Seller avatar"
        />
        <button onClick={handleOpenModal} className="avatar-upload-button">
          Choose Avatar
        </button>
      </div>
    </>
  );
};

export default AvatarUpload;
