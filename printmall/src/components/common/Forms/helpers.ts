import { TFunction } from 'i18next';
import { SelectedOptionType } from '../../../types/Shipping';

export const getShippingMethods = (
  selectedCountry: SelectedOptionType,
  t: TFunction
) => {
  if (selectedCountry.value === 'UA') {
    return [
      {
        value: 'nova_post',
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
