// eslint-disable-next-line @typescript-eslint/ban-ts-comment
//@ts-nocheck

import * as yup from 'yup';

export const getSupportValidationSchema = (t: any) => {
  return yup.object().shape({
    first_name: yup
      .string()
      .matches(/^[A-Za-z\u0400-\u04FF -]+$/, t('form.firstNameValidError'))
      .required(t('form.firstNameError')),
    last_name: yup
      .string()
      .matches(/^[A-Za-z\u0400-\u04FF -]+$/, t('form.lastNameValidError'))
      .required(t('form.lastNameError')),
    email: yup
      .string()
      .email(t('form.emailErrorInvalid'))
      .matches(/@[^.]*\./, t('form.emailErrorInvalid'))
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
    first_name: yup
      .string()
      .matches(/^[A-Za-z\u0400-\u04FF -]+$/, t('form.firstNameValidError'))
      .required(t('form.firstNameError')),
    last_name: yup
      .string()
      .matches(/^[A-Za-z\u0400-\u04FF -]+$/, t('form.lastNameValidError'))
      .required(t('form.lastNameError')),
    email: yup
      .string()
      .email(t('form.emailErrorInvalid'))
      .matches(/@[^.]*\./, t('form.emailErrorInvalid'))
      .required(t('form.emailErrorRequired')),
    phone: yup
      .string()
      .matches(/^[\d\s()-]{11,16}$/, t('form.phoneErrorInvalid'))
      .required(t('form.phoneErrorRequired')),
    address_line_1: yup.string().when('country', {
      is: (country) => country !== 'UA',
      then: () => yup.string().required(t('form.addressError')),
    }),
    country: yup.string().required(),
    city: yup
      .string()
      // .matches(/^[A-Za-z\u0400-\u04FF -]+$/, t('form.cityValidError'))
      .required(t('form.cityError')),
    warehouse: yup.string().when('country', {
      is: (country) => country === 'UA',
      then: () => yup.string().required(t('form.warehouseErrorRequired')),
    }),
    region: yup.string().when('country', {
      is: (country) => country !== 'UA',
      then: () => yup.string().required(t('form.regionError')),
    }),
    zip_code: yup.string().when('country', {
      is: (country) => country !== 'UA',
      then: () =>
        yup
          .string()
          .required(t('form.zipErrorRequired'))
          .matches(/^[0-9]{5}$/, t('form.zipErrorInvalid')),
    }),
  });
};
