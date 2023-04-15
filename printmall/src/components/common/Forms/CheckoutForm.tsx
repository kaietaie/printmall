import React, { memo, useEffect, useMemo, useState } from 'react';
import TextInput from '../TextInput';
import { useFormik } from 'formik';
import { ReactComponent as ArrowForward } from '../../images/arrow_forward.svg';
import { CheckoutFormValues } from '../../../types/Forms';
import Button from '../Buttons';
import { useTranslation } from 'react-i18next';
import { getCheckoutValidationSchema } from './validationSchema';
import TelephoneInput from '../TelephoneInput/TelephoneInput';
import countryList from 'react-select-country-list';
import { useNavigate } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { AppDispatch } from '../../../store/store';
import { sendShippingInfoThunk } from '../../../store/shipping/shippingThunks';
import Select from '../Select';
import SelectSearch from '../SelectSearch';
import { ReactSelectOptionsType } from '../SelectSearch/SelectSearch';
import {
  getNovaPostCities,
  getNovaPostWarehouses,
} from '../../../api/shippingApi';
import { SingleValue } from 'react-select';
import { SelectedOptionType } from '../../../types/Shipping';
import {
  DEFAULT_COUNTRY_VALUE,
  DEFAULT_NOVA_POSHTA_CITY_OPTIONS,
  INITIAL_SELECT_SEARCH_VALUE,
} from './constants';
import { getShippingMethods } from './helpers';
import SelectSearchAsync from '../SelectSearch/SelectSearchAsync';

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
      city: INITIAL_SELECT_SEARCH_VALUE as unknown as SelectedOptionType,
      warehouse: INITIAL_SELECT_SEARCH_VALUE as unknown as SelectedOptionType,
      region: '',
      zip_code: '',
      shipping_method: '',
    },
    validationSchema,
    onSubmit: async (values) => {
      dispatch(
        sendShippingInfoThunk({
          ...values,
          shipping_method: shippingMethods[0].value,
        })
      );

      navigate(`/payment`);
    },
  });

  const [selectedCountry, setSelectedCountry] = useState<SelectedOptionType>(
    DEFAULT_COUNTRY_VALUE
  );

  const [cityOptionsError, setCityOptionsError] = useState<boolean>(false);

  const [warehouseOptions, setWarehouseOptions] = useState<
    SelectedOptionType[]
  >([]);

  const shippingMethods = getShippingMethods(selectedCountry, t);

  const handleCountryChange = (selectedOption: SingleValue<string>) => {
    if (selectedOption) {
      formik.setFieldValue('city', INITIAL_SELECT_SEARCH_VALUE);
      const { value, label } = selectedOption as unknown as SelectedOptionType;
      setSelectedCountry({ value, label });
      formik.setFieldValue('country', value);
    } else {
      setSelectedCountry(INITIAL_SELECT_SEARCH_VALUE);
      formik.setFieldValue('country', '');
      formik.setFieldValue('city', INITIAL_SELECT_SEARCH_VALUE);
    }
  };

  const isUkraineSelected = selectedCountry.value === 'UA';

  const citySelectError =
    cityOptionsError && !formik.values.city
      ? t('form.cityUkrError')
      : formik.touched.city?.label && formik.errors.city?.label;

  useEffect(() => {
    if (formik.values.city) {
      getNovaPostWarehouses(formik.values.city.value)
        .then((options) => {
          setWarehouseOptions(options);
        })
        .catch((error) => {
          console.error(error);
        });
    }
  }, [formik.values.city]);

  const handleLoadCityOptions = async (
    inputValue: string,
    callback: (options: any) => void
  ) => {
    try {
      const options = await getNovaPostCities(inputValue);
      callback(options);
    } catch (error) {
      console.error(error);
      setCityOptionsError(true);
    }
  };

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
            value={formik.values.first_name}
            fullWidth
          />

          <TextInput
            label={t('form.lastName')}
            type="text"
            name="last_name"
            error={formik.touched.last_name && formik.errors.last_name}
            onChange={formik.handleChange}
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
          value={formik.values.email}
          fullWidth
        />

        <TelephoneInput
          name="phone"
          label={t('form.phone')}
          error={formik.touched.phone && formik.errors.phone}
          onChange={(value) => formik.setFieldValue('phone', value)}
          value={formik.values.phone}
          fullWidth
        />

        <SelectSearch
          className="checkout-form-short-input"
          options={options as unknown as ReactSelectOptionsType}
          label={t('form.country')}
          value={selectedCountry as unknown as SelectedOptionType}
          onChange={handleCountryChange}
          error={formik.touched.country && formik.errors.country}
        />

        {formik.values.country && (
          <Select
            className="checkout-form-short-input"
            options={shippingMethods}
            label={t('form.shippingMethod')}
            name="shipping_method"
            value={formik.values.shipping_method}
            onChange={formik.handleChange('shipping_method')}
          />
        )}

        {isUkraineSelected && formik.values.country && (
          <>
            <SelectSearchAsync
              label={t('form.city')}
              className="select-search"
              name="city"
              value={formik.values.city as unknown as SelectedOptionType}
              onChange={(option) => {
                formik.setFieldValue('city', option);
                formik.setFieldValue('warehouse', INITIAL_SELECT_SEARCH_VALUE);
              }}
              loadOptions={handleLoadCityOptions}
              defaultOptions={DEFAULT_NOVA_POSHTA_CITY_OPTIONS}
              fullWidth
              error={citySelectError}
            />

            <SelectSearchAsync
              label={t('form.warehouse')}
              className="select-search"
              name="warehouse"
              value={formik.values.warehouse as unknown as SelectedOptionType}
              onChange={(option) => formik.setFieldValue('warehouse', option)}
              loadOptions={async (inputValue: string, callback: any) => {
                const options = await getNovaPostWarehouses(
                  formik.values.city?.value,
                  inputValue
                );
                callback(options);
              }}
              defaultOptions={warehouseOptions}
              fullWidth
              error={
                formik.touched.warehouse?.label &&
                formik.errors.warehouse?.label
              }
            />
          </>
        )}

        {!isUkraineSelected && formik.values.country && (
          <>
            <TextInput
              className="checkout-form-short-input"
              label={t('form.city')}
              type="text"
              name="city"
              error={formik.touched.city?.label && formik.errors.city?.label}
              onChange={(e) => {
                e.preventDefault();
                const option = { value: '', label: e.target.value };
                formik.setFieldValue('city', option);
              }}
              value={formik.values.city.label}
            />

            <TextInput
              label={t('form.address1')}
              type="text"
              name="address_line_1"
              error={
                formik.touched.address_line_1 && formik.errors.address_line_1
              }
              onChange={formik.handleChange}
              value={formik.values.address_line_1}
              fullWidth
            />
            <TextInput
              label={t('form.address2')}
              type="text"
              name="address_line_2"
              error={
                formik.touched.address_line_2 && formik.errors.address_line_2
              }
              onChange={formik.handleChange}
              value={formik.values.address_line_2}
              fullWidth
            />
            <TextInput
              className="checkout-form-short-input"
              label={t('form.region')}
              type="text"
              name="region"
              error={formik.touched.region && formik.errors.region}
              onChange={formik.handleChange}
              value={formik.values.region}
            />
            <TextInput
              className="checkout-form-short-input"
              label={t('form.zipCode')}
              type="text"
              name="zip_code"
              error={formik.touched.zip_code && formik.errors.zip_code}
              onChange={formik.handleChange}
              value={formik.values.zip_code}
            />
          </>
        )}

        <Button
          className="form-submit-button"
          iconEnd={<ArrowForward />}
          buttonType="submit"
        >
          {t('form.proceedToPaymentBtn')}
        </Button>
      </form>
    </div>
  );
};

export default memo(CheckoutForm);
