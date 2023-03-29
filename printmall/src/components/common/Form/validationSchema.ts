import * as yup from 'yup';

export const getValidationSchema = (t: any) => {
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
