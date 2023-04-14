import { TFunction } from 'i18next';
import { selectedOptionType } from '../../../types/Shipping';

export const getShippingMethods = (
  selectedCountry: selectedOptionType,
  t: TFunction
) => {
  if (selectedCountry.value === 'UA') {
    return [
      {
        value: 'new_post',
        label: t('shipping.novaPoshta'),
      },
    ];
  } else {
    return [
      {
        value: 'ukr_post',
        label: t('shipping.ukrposhta'),
      },
    ];
  }
};
