import { SetStateAction, useState } from 'react';
import defaultAvatar from '../images/defaultImages/avatar_big.png';
import Modal from '@mui/material/Modal';
import Box from '@mui/material/Box';
import Avatar from 'react-avatar-edit';

const style = {
  position: 'absolute' as const,
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  width: 400,
  bgcolor: 'background.paper',
  border: '2px solid #000',
  boxShadow: 24,
  p: 4,
};

const AvatarUpload = () => {
  const [open, setOpen] = useState(false);
  const [src, setSrc] = useState('');
  const [preview, setPreview] = useState(null);

  const handleClose = () => {
    setPreview(null);
  };
  const handleCrop = (view: any) => {
    setPreview(view);
  };

  const handleOpenModal = () => setOpen(true);

  const handleCloseModal = () => setOpen(false);

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
        </Box>
      </Modal>
      <div className="avatar-upload-container">
        <img
          className="avatar-upload-image"
          src={defaultAvatar}
          alt="Seller avatar"
        />
        <button onClick={handleOpenModal} className="avatar-upload-label">
          Choose Avatar
        </button>
      </div>
    </>
  );
};

export default AvatarUpload;
