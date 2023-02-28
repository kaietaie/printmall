import i18next from 'i18next';
import { initReactI18next } from 'react-i18next';
import { resources } from './resources';

const htmlElement = document.querySelector('html');
const language = htmlElement ? htmlElement.lang : 'en';

i18next.use(initReactI18next).init({
  lng: language,
  debug: true,
  fallbackLng: 'en',
  resources
});
