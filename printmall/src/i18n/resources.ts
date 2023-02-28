import enHeader from '../../public/assets/locales/en/components/header.json';
import uaHeader from '../../public/assets/locales/ua/components/header.json';
//for TypeScript purposes. Looking for better solution
export const resources = {
  en: {
    translation: { ...enHeader }
  },
  ua: {
    translation: { ...uaHeader }
  }
};
