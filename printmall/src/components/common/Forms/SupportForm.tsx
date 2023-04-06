import React, { memo, useState } from 'react';
import TextInput from '../TextInput';
import { useFormik } from 'formik';
import { ReactComponent as ArrowForward } from '../../images/arrow_forward.svg';
import { SupportFormValues } from '../../../types/Forms';
import Button from '../Buttons';
import { sendUserMessage } from '../../../api/supportApi';
import Checkbox from '../Checkbox';
import { useTranslation } from 'react-i18next';
import { toast } from 'react-toastify';
import { getSupportValidationSchema } from './validationSchema';
import TelephoneInput from '../TelephoneInput/TelephoneInput';
import { Link } from 'react-router-dom';

import './Form.sass';

interface SupportFormProps {
  onClose: () => void;
}

const SupportForm: React.FC<SupportFormProps> = ({ onClose }) => {
  const { t } = useTranslation();
  const validationSchema = getSupportValidationSchema(t);

  const [isPolicyChecked, setIPolicyChecked] = useState(false);

  const handleTogglePolicy = () => {
    setIPolicyChecked(!isPolicyChecked);
  };

  const formik = useFormik<SupportFormValues>({
    initialValues: {
      first_name: '',
      last_name: '',
      email: '',
      phone: '',
      message: '',
    },
    validationSchema,
    onSubmit: async (values) => {
      try {
        await sendUserMessage(values);
        toast.info(t('form.submitCompleteMessage'));
        onClose();
      } catch (error) {
        console.error(error);
        toast.error(t('form.submitFailMessage'));
      }
    },
  });

  return (
    <form className="form support-form" onSubmit={formik.handleSubmit}>
      <div className="form-names">
        <TextInput
          className="form-first-name"
          label={t('form.firstName')}
          type="text"
          name="first_name"
          error={formik.touched.first_name && formik.errors.first_name}
          onChange={formik.handleChange}
          onBlur={formik.handleBlur}
          value={formik.values.first_name}
          fullWidth
        />

        <TextInput
          label={t('form.lastName')}
          type="text"
          name="last_name"
          error={formik.touched.last_name && formik.errors.last_name}
          onChange={formik.handleChange}
          onBlur={formik.handleBlur}
          value={formik.values.last_name}
          fullWidth
        />
      </div>

      <TextInput
        label={t('form.email')}
        type="email"
        name="email"
        placeholder="you@company.com"
        error={formik.touched.email && formik.errors.email}
        onChange={formik.handleChange}
        onBlur={formik.handleBlur}
        value={formik.values.email}
        fullWidth
      />

      <TelephoneInput
        name="phone"
        label={t('form.phone')}
        error={formik.touched.phone && formik.errors.phone}
        onChange={(value) => formik.setFieldValue('phone', value)}
        onBlur={formik.handleBlur('phone')}
        value={formik.values.phone}
        fullWidth
      />

      <TextInput
        label={t('form.message')}
        type="textarea"
        name="message"
        error={formik.touched.message && formik.errors.message}
        onChange={formik.handleChange}
        onBlur={formik.handleBlur}
        value={formik.values.message}
        fullWidth
      />

      <div className="form-policy">
        <Checkbox
          onChange={handleTogglePolicy}
          label={t('form.privacyCheckbox')}
          checked={isPolicyChecked}
        />
        <Link target="_blank" to="policy" className="form-policy-link">
          {t('form.privacyButton')}
        </Link>
      </div>

      <Button
        isDisabled={!isPolicyChecked}
        className="form-submit-button"
        iconEnd={<ArrowForward />}
        buttonType="submit"
      >
        {t('form.sendMessageButton')}
      </Button>
    </form>
  );
};

export default memo(SupportForm);
