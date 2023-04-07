import React, { memo, useMemo } from 'react';
import TextInput from '../TextInput';
import { useFormik } from 'formik';
import { ReactComponent as ArrowForward } from '../../images/arrow_forward.svg';
import { CheckoutFormValues } from '../../../types/Forms';
import Button from '../Buttons';
import { useTranslation } from 'react-i18next';
import { getCheckoutValidationSchema } from './validationSchema';
import TelephoneInput from '../TelephoneInput/TelephoneInput';
import countryList from 'react-select-country-list';
import Select from '../Select';
import { useNavigate } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { AppDispatch } from '../../../store/store';
import { sendShippingInfoThunk } from '../../../store/shipping/shippingThunks';

import './Form.sass';

const CheckoutForm: React.FC = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();
  const dispatch = useDispatch<AppDispatch>();
  const options = useMemo(() => countryList().getData(), []);
  const validationSchema = getCheckoutValidationSchema(t);

  const formik = useFormik<CheckoutFormValues>({
    initialValues: {
      first_name: '',
      last_name: '',
      email: '',
      phone: '',
      address_line_1: '',
      address_line_2: '',
      country: 'UA',
      city: '',
      region: '',
      zip_code: '',
    },
    validationSchema,
    onSubmit: async (values) => {
      dispatch(sendShippingInfoThunk(values));
      navigate(`/payment`);
    },
  });

  return (
    <div className="checkout-form-container">
      <h2 className="checkout-form-title">{t('form.checkoutTitle')}</h2>
      <span className="checkout-form-sub-title">
        {t('form.checkoutSubTitle')}
      </span>
      <form className="form checkout-form" onSubmit={formik.handleSubmit}>
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
          label={t('form.address1')}
          type="text"
          name="address_line_1"
          error={formik.touched.address_line_1 && formik.errors.address_line_1}
          onChange={formik.handleChange}
          onBlur={formik.handleBlur}
          value={formik.values.address_line_1}
          fullWidth
        />

        <TextInput
          label={t('form.address2')}
          type="text"
          name="address_line_2"
          error={formik.touched.address_line_2 && formik.errors.address_line_2}
          onChange={formik.handleChange}
          onBlur={formik.handleBlur}
          value={formik.values.address_line_2}
          fullWidth
        />

        <Select
          className="checkout-form-short-input"
          label={t('form.country')}
          name="country"
          options={options}
          value={formik.values.country}
          onChange={formik.handleChange}
          onBlur={formik.handleBlur}
        />

        <TextInput
          className="checkout-form-short-input"
          label={t('form.city')}
          type="text"
          name="city"
          error={formik.touched.city && formik.errors.city}
          onChange={formik.handleChange}
          onBlur={formik.handleBlur}
          value={formik.values.city}
        />

        <TextInput
          className="checkout-form-short-input"
          label={t('form.region')}
          type="text"
          name="region"
          error={formik.touched.region && formik.errors.region}
          onChange={formik.handleChange}
          onBlur={formik.handleBlur}
          value={formik.values.region}
        />

        <TextInput
          className="checkout-form-short-input"
          label={t('form.zipCode')}
          type="text"
          name="zip_code"
          error={formik.touched.zip_code && formik.errors.zip_code}
          onChange={formik.handleChange}
          onBlur={formik.handleBlur}
          value={formik.values.zip_code}
        />

        <Button
          className="form-submit-button"
          iconEnd={<ArrowForward />}
          buttonType="submit"
        >
          Proceed to payment
        </Button>
      </form>
    </div>
  );
};

export default memo(CheckoutForm);
