import * as yup from 'yup';

export const getSupportValidationSchema = (t: any) => {
  return yup.object().shape({
    first_name: yup.string().required(t('form.firstNameError')),
    last_name: yup.string().required(t('form.lastNameError')),
    email: yup
      .string()
      .email(t('form.emailErrorInvalid'))
      .required(t('form.emailErrorRequired')),
    phone: yup
      .string()
      .matches(/^[\d\s()-]{11,16}$/, t('form.phoneErrorInvalid'))
      .required(t('form.phoneErrorRequired')),
    message: yup.string().required(t('form.messageError')),
  });
};

export const getCheckoutValidationSchema = (t: any) => {
  return yup.object().shape({
    first_name: yup.string().required(t('form.firstNameError')),
    last_name: yup.string().required(t('form.lastNameError')),
    email: yup
      .string()
      .email(t('form.emailErrorInvalid'))
      .required(t('form.emailErrorRequired')),
    phone: yup
      .string()
      .matches(/^[\d\s()-]{11,16}$/, t('form.phoneErrorInvalid'))
      .required(t('form.phoneErrorRequired')),
    address_line_1: yup.string().required('Address is required'),
    city: yup.string().required('City is required'),
    region: yup.string().required('Region is required'),
    zip_code: yup
      .string()
      .required('Zip code is required')
      .matches(/^[0-9]+$/, 'Zip code must be a number'),
  });
};
