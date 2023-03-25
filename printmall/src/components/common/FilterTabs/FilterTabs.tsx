import React from 'react';
import './FilterTabs.sass';

const filterItems = [
  { label: 'Bestsellers' },
  { label: 'Stand with Ukraine' },
  { label: 'Durnev' },
  { label: 'Starlink' },
  { label: 'Lego' },
  { label: 'Star Wars' },
];

interface FilterTabsProps {
  filterTitles: string[];
}

const FilterTabs: React.FC<FilterTabsProps> = ({ filterTitles }) => {
  return (
    <div className="filter-tabs">
      <ul className="filter-tabs-list">
        {filterTitles.map((title) => {
          return (
            <li key={title}>
              <button className="filter-tabs-button">{title}</button>
            </li>
          );
        })}
      </ul>
    </div>
  );
};

export default FilterTabs;
