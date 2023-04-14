import * as yup from 'yup';
import { TFunction } from 'i18next';

export const getSupportValidationSchema = (t: TFunction) => {
  const firstNameValidError = t('form.firstNameValidError');
  const firstNameError = t('form.firstNameError');
  const lastNameValidError = t('form.lastNameValidError');
  const lastNameError = t('form.lastNameError');
  const emailErrorInvalid = t('form.emailErrorInvalid');
  const emailErrorRequired = t('form.emailErrorRequired');
  const phoneErrorInvalid = t('form.phoneErrorInvalid');
  const phoneErrorRequired = t('form.phoneErrorRequired');
  const messageError = t('form.messageError');

  return yup.object().shape({
    first_name: yup
      .string()
      .matches(/^[A-Za-z\u0400-\u04FF -]+$/, firstNameValidError)
      .required(firstNameError),
    last_name: yup
      .string()
      .matches(/^[A-Za-z\u0400-\u04FF -]+$/, lastNameValidError)
      .required(lastNameError),
    email: yup
      .string()
      .email(emailErrorInvalid)
      .matches(/@[^.]*\./, emailErrorInvalid)
      .required(emailErrorRequired),
    phone: yup
      .string()
      .matches(/^[\d\s()-]{11,16}$/, phoneErrorInvalid)
      .required(phoneErrorRequired),
    message: yup.string().required(messageError),
  });
};

export const getCheckoutValidationSchema = (t: TFunction) => {
  const firstNameValidError = t('form.firstNameValidError');
  const firstNameError = t('form.firstNameError');
  const lastNameValidError = t('form.lastNameValidError');
  const lastNameError = t('form.lastNameError');
  const emailErrorInvalid = t('form.emailErrorInvalid');
  const emailErrorRequired = t('form.emailErrorRequired');
  const phoneErrorInvalid = t('form.phoneErrorInvalid');
  const phoneErrorRequired = t('form.phoneErrorRequired');
  const addressError = t('form.addressError');
  const cityError = t('form.cityError');
  const countryErrorRequired = t('form.countryErrorRequired');
  const warehouseErrorRequired = t('form.warehouseErrorRequired');
  const regionError = t('form.regionError');
  const zipErrorRequired = t('form.zipErrorRequired');
  const zipErrorInvalid = t('form.zipErrorInvalid');

  return yup.object().shape({
    first_name: yup
      .string()
      .matches(/^[A-Za-z\u0400-\u04FF -]+$/, firstNameValidError)
      .required(firstNameError),
    last_name: yup
      .string()
      .matches(/^[A-Za-z\u0400-\u04FF -]+$/, lastNameValidError)
      .required(lastNameError),
    email: yup
      .string()
      .email(emailErrorInvalid)
      .matches(/@[^.]*\./, emailErrorInvalid)
      .required(emailErrorRequired),
    phone: yup
      .string()
      .matches(/^[\d\s()-]{11,16}$/, phoneErrorInvalid)
      .required(phoneErrorRequired),
    address_line_1: yup.string().when('country', {
      is: (country: string) => country !== 'UA',
      then: () => yup.string().required(addressError),
    }),
    country: yup.string().required(countryErrorRequired),
    city: yup
      .string()
      // .matches(/^[A-Za-z\u0400-\u04FF -]+$/, t('form.cityValidError'))
      .required(cityError),
    warehouse: yup.string().when('country', {
      is: (country: string) => country === 'UA',
      then: () => yup.string().required(warehouseErrorRequired),
    }),
    region: yup.string().when('country', {
      is: (country: string) => country !== 'UA',
      then: () => yup.string().required(regionError),
    }),
    zip_code: yup.string().when('country', {
      is: (country: string) => country !== 'UA',
      then: () =>
        yup
          .string()
          .required(zipErrorRequired)
          .matches(/^[0-9]{5}$/, zipErrorInvalid),
    }),
  });
};
