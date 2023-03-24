import React, { memo, useState } from 'react';
import TextInput from '../TextInput';
import { useFormik } from 'formik';
import { ReactComponent as ArrowForward } from '../../images/arrow_forward.svg';
import { SupportFormValues } from '../../../types/Support';
import * as yup from 'yup';
import Button from '../Buttons';
import { sendUserMessage } from '../../../api/supportApi';
import Checkbox from '../Checkbox';
import { useTranslation } from 'react-i18next';

const validationSchema = yup.object().shape({
  first_name: yup.string().required('First name is required'),
  last_name: yup.string().required('Last name is required'),
  email: yup
    .string()
    .email('Invalid email address')
    .required('Email is required'),
  phone: yup
    .string()
    .matches(/^[+]{0,1}([0-9]{12})$/, 'Invalid phone number')
    .required('Phone number is required'),
  message: yup.string().required('Message is required'),
});

const SupportForm = () => {
  const { t } = useTranslation();

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
    onSubmit: (values) => {
      // handle form submission here
      const res = sendUserMessage(values);
      console.log(res);
    },
  });

  return (
    <form className="support-form" onSubmit={formik.handleSubmit}>
      <div className="support-form-names">
        <TextInput
          className="support-form-first-name"
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

      <TextInput
        label={t('form.phone')}
        type="tel"
        name="phone"
        error={formik.touched.phone && formik.errors.phone}
        onChange={formik.handleChange}
        onBlur={formik.handleBlur}
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

      <div className="support-form-policy">
        <Checkbox
          onChange={handleTogglePolicy}
          label={t('form.privacyCheckbox')}
          checked={isPolicyChecked}
        />
        <button type="button" className="support-form-policy-button">
          {t('form.privacyButton')}
        </button>
      </div>

      <Button
        isDisabled={!isPolicyChecked}
        className="support-form-submit-button"
        iconEnd={<ArrowForward />}
        buttonType="submit"
      >
        {t('form.sendMessageButton')}
      </Button>
    </form>
  );
};

export default memo(SupportForm);
