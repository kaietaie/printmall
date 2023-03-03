import React from 'react';
import { NavLink } from 'react-router-dom';
import { navItems } from './navItems';
import squish from '../../Helpers/ClassNameHelper';
import { useTranslation } from 'react-i18next';
import './NavBar.sass';

const NavBar: React.FC = () => {
  const { t } = useTranslation();
  const classNameHelper = ({ isActive }: { isActive: boolean }): string => {
    return squish`
      nav-item
      ${isActive ? 'nav-item--active' : ''}`;
  };

  return (
    <nav className="nav-bar">
      <ul className="nav-bar-list">
        {navItems.map((item) => {
          const Icon = item.icon;

          return (
            <li key={item.label}>
              <NavLink to={item.to} className={classNameHelper}>
                <Icon />
                {t(item.label)}
              </NavLink>
            </li>
          );
        })}
      </ul>
    </nav>
  );
};

export default NavBar;
