import './FilterTabs.sass';

const filterItems = [
  { label: 'Bestsellers' },
  { label: 'Stand with Ukraine' },
  { label: 'Durnev' },
  { label: 'Starlink' },
  { label: 'Lego' },
  { label: 'Lego' },
  { label: 'Star Wars' },
];
const FilterTabs = () => {
  return (
    <div className="filter-tabs">
      <ul className="filter-tabs-list">
        {filterItems.map((item) => {
          return (
            <li key={item.label}>
              <button className="filter-tabs-button">{item.label}</button>
            </li>
          );
        })}
      </ul>
    </div>
  );
};

export default FilterTabs;
