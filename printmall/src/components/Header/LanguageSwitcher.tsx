import i18next from 'i18next';
import cookies from 'js-cookie';

const LanguageSwitcher = () => {
  const currentLanguage = cookies.get('i18next') || 'ua';
  const handleChangeLanguage = (code: string) => {
    i18next.changeLanguage(code);
  };

  return (
    <div className="language-switcher">
      <button
        className="language-switcher-btn"
        onClick={() => handleChangeLanguage('en')}>
        <span
          className={currentLanguage === 'en' ? 'language-switcher-text' : ''}>
          EN
        </span>
      </button>
      |
      <button
        className="language-switcher-btn"
        onClick={() => handleChangeLanguage('ua')}>
        <span
          className={currentLanguage === 'ua' ? 'language-switcher-text' : ''}>
          UA
        </span>
      </button>
    </div>
  );
};

export default LanguageSwitcher;
