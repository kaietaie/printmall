import { changeLanguage } from 'i18next';
import cookies from 'js-cookie';
import { useState } from 'react';

const LanguageSwitcher = () => {
  const currentLanguage = cookies.get('i18next') || 'ua';

  const [language, setLanguage] = useState(currentLanguage);

  const handleChangeLanguage = (code: string) => {
    setLanguage(code);
    changeLanguage(code);
  };

  return (
    <div className="language-switcher">
      <button
        className="language-switcher-btn"
        onClick={() => handleChangeLanguage('en')}
      >
        <span className={language === 'en' ? 'language-switcher-text' : ''}>
          EN
        </span>
      </button>
      |
      <button
        className="language-switcher-btn"
        onClick={() => handleChangeLanguage('ua')}
      >
        <span className={language === 'ua' ? 'language-switcher-text' : ''}>
          UA
        </span>
      </button>
    </div>
  );
};

export default LanguageSwitcher;
