// eslint-disable-next-line @typescript-eslint/ban-ts-comment
//@ts-nocheck

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
import AsyncSelect from 'react-select/async';
import {
  ReactSelectOptionsType,
  ReactSelectValueType,
} from '../SelectSearch/SelectSearch';
import {
  getNovaPostCities,
  getNovaPostWarehouses,
} from '../../../api/shippingApi';
import { SingleValue } from 'react-select';
import { selectedOptionType } from '../../../types/Shipping';
import {
  DEFAULT_COUNTRY_VALUE,
  DEFAULT_NOVA_POSHTA_CITY_OPTIONS,
  INITIAL_SELECT_SEARCH_VALUE,
} from './constants';
import { getShippingMethods } from './helpers';

import './Form.sass';

const CheckoutForm: React.FC = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();
  const dispatch = useDispatch<AppDispatch>();
  const options = useMemo(() => countryList().getData(), []);
  const validationSchema = getCheckoutValidationSchema(t);

  const [selectedCountry, setSelectedCountry] = useState<selectedOptionType>(
    DEFAULT_COUNTRY_VALUE
  );

  const [cityInputValue, setCityInputValue] = useState<string>('');
  const [selectedCity, setSelectedCity] = useState<selectedOptionType>(
    INITIAL_SELECT_SEARCH_VALUE
  );
  const [cityOptions, setCityOptions] = useState<selectedOptionType[]>([]);
  const [cityOptionsError, setCityOptionsError] = useState<boolean>(false);

  const [warehouseInputValue, setWarehouseInputValue] = useState<string>('');
  const [selectedWarehouse, setSelectedWarehouse] =
    useState<selectedOptionType>(INITIAL_SELECT_SEARCH_VALUE);
  const [warehouseOptions, setWarehouseOptions] = useState<
    selectedOptionType[]
  >([]);

  const shippingMethods = getShippingMethods(selectedCountry, t);

  // useEffect(() => {
  //   if (selectedCity.value) {
  //     getNovaPostWarehouses(selectedCity.value, warehouseInputValue)
  //       .then((options) => {
  //         setWarehouseOptions(options);
  //       })
  //       .catch((error) => {
  //         console.error(error);
  //       });
  //   }
  // }, [selectedCity.value, warehouseInputValue]);

  const handleCityInputChange = async (inputValue: string) => {
    setCityInputValue(inputValue);
    try {
      const options = await getNovaPostCities(inputValue);
      setCityOptions(options);
    } catch (error) {
      console.error(error);
      setCityOptionsError(true);
    }
  };

  const handleWarehouseInputChange = async (inputValue: string) => {
    setWarehouseInputValue(inputValue);
  };

  const handleCityChange = (option: SingleValue<string>) => {
    if (option) {
      setSelectedWarehouse(INITIAL_SELECT_SEARCH_VALUE);
      setCityOptionsError(false);
      const { value, label } = option as unknown as selectedOptionType;
      setSelectedCity({ value, label });
      formik.setFieldValue('city', value);
    } else {
      setSelectedCity(INITIAL_SELECT_SEARCH_VALUE);
      formik.setFieldValue('city', '');
    }
  };

  const handleCountryChange = (selectedOption: SingleValue<string>) => {
    if (selectedOption) {
      formik.setFieldValue('city', '');
      // formik.setFieldValue('shi', '');
      const { value, label } = selectedOption as unknown as selectedOptionType;
      setSelectedCountry({ value, label });
      formik.setFieldValue('country', value);
    } else {
      setSelectedCountry(INITIAL_SELECT_SEARCH_VALUE);
      formik.setFieldValue('country', '');
      formik.setFieldValue('city', '');
    }
  };

  const handleWarehouseChange = (option: SingleValue<string>) => {
    if (option) {
      const { value, label } = option as unknown as selectedOptionType;
      setSelectedWarehouse({ value, label });
      formik.setFieldValue('warehouse', value);
    } else {
      setSelectedWarehouse(INITIAL_SELECT_SEARCH_VALUE);
      formik.setFieldValue('warehouse', '');
    }
  };
  const isUkraineSelected = selectedCountry.value === 'UA';

  const formik = useFormik<CheckoutFormValues>({
    initialValues: {
      first_name: '',
      last_name: '',
      email: '',
      phone: '',
      address_line_1: '',
      address_line_2: '',
      country: 'UA',
      city: null,
      warehouse: null,
      region: '',
      zip_code: '',
      shipping_method: '',
    },
    validationSchema,
    onSubmit: async (values) => {
      const cityValue = isUkraineSelected ? values.city.value : values.city;
      dispatch(
        sendShippingInfoThunk({
          ...values,
          city: cityValue,
          warehouse: values.city.value,
          shipping_method: shippingMethods[0].value,
        })
      );

      navigate(`/payment`);
    },
  });

  const novaPoshtaCityOptions =
    selectedCity.value || cityInputValue
      ? cityOptions
      : DEFAULT_NOVA_POSHTA_CITY_OPTIONS;

  const citySelectError =
    cityOptionsError && !selectedCity.value
      ? t('form.cityUkrError')
      : formik.touched.city && formik.errors.city;

  useEffect(() => {
    if (formik.values.city) {
      getNovaPostWarehouses(formik.values.city.value, warehouseInputValue)
        .then((options) => {
          setWarehouseOptions(options);
        })
        .catch((error) => {
          console.error(error);
        });
    }
  }, [formik.values.city, selectedCity.value, warehouseInputValue]);

  const loadOptions = async (
    inputValue: string,
    callback: (options: any) => void
  ) => {
    const options = await getNovaPostCities(inputValue);
    callback(options);
  };
  console.log(shippingMethods);
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
          value={selectedCountry as unknown as ReactSelectValueType}
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
            <AsyncSelect
              className="select-search"
              name="city"
              cacheOptions
              value={formik.values.city}
              onChange={(option: Option) =>
                formik.setFieldValue('city', option)
              }
              loadOptions={loadOptions}
              defaultOptions={DEFAULT_NOVA_POSHTA_CITY_OPTIONS}
              isClearable
            />

            {/*<SelectSearch*/}
            {/*  label={t('form.city')}*/}
            {/*  inputValue={cityInputValue}*/}
            {/*  options={*/}
            {/*    novaPoshtaCityOptions as unknown as ReactSelectOptionsType*/}
            {/*  }*/}
            {/*  onInputChange={handleCityInputChange}*/}
            {/*  onChange={handleCityChange}*/}
            {/*  value={selectedCity as unknown as ReactSelectValueType}*/}
            {/*  fullWidth*/}
            {/*  error={citySelectError}*/}
            {/*/>*/}

            <AsyncSelect
              className="select-search"
              name="warehouse"
              cacheOptions
              value={formik.values.warehouse}
              onChange={(option: Option) =>
                formik.setFieldValue('warehouse', option)
              }
              loadOptions={async (inputValue: string, callback) => {
                const options = await getNovaPostWarehouses(
                  formik.values.city.value,
                  inputValue
                );
                callback(options);
              }}
              isClearable
              defaultOptions={warehouseOptions}
            />

            {/*<SelectSearch*/}
            {/*  inputValue={warehouseInputValue}*/}
            {/*  options={warehouseOptions as unknown as ReactSelectOptionsType}*/}
            {/*  onInputChange={handleWarehouseInputChange}*/}
            {/*  onChange={handleWarehouseChange}*/}
            {/*  value={selectedWarehouse as unknown as ReactSelectValueType}*/}
            {/*  label={t('form.warehouse')}*/}
            {/*  fullWidth*/}
            {/*  error={formik.touched.warehouse && formik.errors.warehouse}*/}
            {/*/>*/}
          </>
        )}

        {!isUkraineSelected && formik.values.country && (
          <>
            <TextInput
              className="checkout-form-short-input"
              label={t('form.city')}
              type="text"
              name="city"
              error={formik.touched.city && formik.errors.city}
              onChange={formik.handleChange}
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
