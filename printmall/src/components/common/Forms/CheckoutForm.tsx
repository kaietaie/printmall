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

import './Form.sass';
import {
  ReactSelectOptionsType,
  ReactSelectValueType,
} from '../SelectSearch/SelectSearch';
import {
  getNovaPostCities,
  getNovaPostWarehouses,
} from '../../../api/shippingApi';

export interface selectedOptionType {
  value: string;
  label: string;
}

const initialCountryValue = {
  value: 'UA',
  label: 'Ukraine',
};

const initialSelectSearchValue = {
  value: '',
  label: '',
};

const initialCityOptions = [
  { value: '8d5a980d-391c-11dd-90d9-001a92567626', label: 'Київ' },
  { value: 'db5c88f5-391c-11dd-90d9-001a92567626', label: 'Львів' },
  { value: 'db5c88d0-391c-11dd-90d9-001a92567626', label: 'Одеса' },
  { value: 'db5c88e0-391c-11dd-90d9-001a92567626', label: 'Харків' },
  { value: 'db5c88e0-391c-11dd-90d9-001a92567626', label: 'Харків' },
  { value: 'db5c88f0-391c-11dd-90d9-001a92567626', label: 'Дніпро' },
];

const CheckoutForm: React.FC = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();
  const dispatch = useDispatch<AppDispatch>();
  const options = useMemo(() => countryList().getData(), []);
  const validationSchema = getCheckoutValidationSchema(t);

  const [selectedCountry, setSelectedCountry] =
    useState<selectedOptionType>(initialCountryValue);

  const [cityInputValue, setCityInputValue] = useState<string>('');
  const [selectedCity, setSelectedCity] = useState<selectedOptionType>(
    initialSelectSearchValue
  );
  const [cityOptions, setCityOptions] = useState<selectedOptionType[]>([]);
  const [cityOptionsError, setCityOptionsError] = useState<boolean>(false);

  const [warehouseInputValue, setWarehouseInputValue] = useState<string>('');
  const [selectedWarehouse, setSelectedWarehouse] =
    useState<selectedOptionType>(initialSelectSearchValue);
  const [warehouseOptions, setWarehouseOptions] = useState<
    selectedOptionType[]
  >([]);

  const shippingMethods =
    selectedCountry.value === 'UA'
      ? [
          {
            value: 'new_post',
            label: t('shipping.novaPoshta'),
          },
        ]
      : [
          {
            value: 'ukr_post',
            label: t('shipping.ukrposhta'),
          },
        ];
  const handleCityInputChange = async (inputValue: string) => {
    setCityInputValue(inputValue);
    try {
      const options = await getNovaPostCities(inputValue);
      setCityOptions(options);
      setSelectedWarehouse(initialSelectSearchValue);
      setCityOptionsError(false);
    } catch (error) {
      console.error(error);
      setCityOptionsError(true);
    }
  };

  useEffect(() => {
    if (selectedCity.value) {
      getNovaPostWarehouses(selectedCity.value, warehouseInputValue)
        .then((options) => {
          setWarehouseOptions(options);
        })
        .catch((error) => {
          console.error(error);
        });
    }
  }, [selectedCity.value, warehouseInputValue]);

  const handleWarehouseInputChange = async (inputValue: string) => {
    setWarehouseInputValue(inputValue);
    // const options = await getNovaPostWarehouses(selectedCity.value);
    // setWarehouseOptions(options);
  };

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
      warehouse: '',
      region: '',
      zip_code: '',
      shipping_method: shippingMethods[0].value,
    },
    validationSchema,
    onSubmit: async (values) => {
      dispatch(sendShippingInfoThunk(values));
      navigate(`/payment`);
    },
  });

  const novaPoshtaCityOptions =
    selectedCity.value || cityInputValue ? cityOptions : initialCityOptions;

  const citySelectError = cityOptionsError
    ? 'error'
    : formik.touched.city && formik.errors.city;

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

        <SelectSearch
          options={options as unknown as ReactSelectOptionsType}
          label={t('form.country')}
          value={selectedCountry as unknown as ReactSelectValueType}
          onChange={(selectedOption) => {
            if (selectedOption) {
              const { value, label } =
                selectedOption as unknown as selectedOptionType;
              setSelectedCountry({ value, label });
              formik.setFieldValue('country', value);
            } else {
              setSelectedCountry(initialCountryValue);
              formik.setFieldValue('country', '');
            }
          }}
          defaultInputValue="Ukraine"
        />

        <Select
          options={shippingMethods}
          label={t('form.shippingMethod')}
          name="shipping_method"
          value={formik.values.shipping_method}
          onChange={formik.handleChange('shipping_method')}
        />
        {selectedCountry.value === 'UA' ? (
          <>
            <SelectSearch
              label={t('form.city')}
              inputValue={cityInputValue}
              options={
                novaPoshtaCityOptions as unknown as ReactSelectOptionsType
              }
              onInputChange={handleCityInputChange}
              onChange={(option) => {
                const { value, label } =
                  option as unknown as selectedOptionType;
                setSelectedCity({ value, label });
                formik.setFieldValue('city', value);
              }}
              value={selectedCity as unknown as ReactSelectValueType}
              fullWidth
              error={citySelectError}
            />

            <SelectSearch
              inputValue={warehouseInputValue}
              options={warehouseOptions as unknown as ReactSelectOptionsType}
              onInputChange={handleWarehouseInputChange}
              onChange={(option) => {
                const { value, label } =
                  option as unknown as selectedOptionType;
                setSelectedWarehouse({ value, label });
                formik.setFieldValue('warehouse', value);
              }}
              value={selectedWarehouse as unknown as ReactSelectValueType}
              label={t('form.warehouse')}
              fullWidth
              error={formik.touched.warehouse && formik.errors.warehouse}
            />
          </>
        ) : (
          <>
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
              label={t('form.address1')}
              type="text"
              name="address_line_1"
              error={
                formik.touched.address_line_1 && formik.errors.address_line_1
              }
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
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
              onBlur={formik.handleBlur}
              value={formik.values.address_line_2}
              fullWidth
            />
            <TextInput
              label={t('form.region')}
              type="text"
              name="region"
              error={formik.touched.region && formik.errors.region}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
              value={formik.values.region}
            />
            <TextInput
              label={t('form.zipCode')}
              type="text"
              name="zip_code"
              error={formik.touched.zip_code && formik.errors.zip_code}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
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
