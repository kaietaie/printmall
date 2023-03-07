import React from 'react';
import './SectionTitle.sass';
interface SectionTitleProps {
  children: string;
  topSubTitle?: string | null;
  bottomSubTitle?: string | null;
}

const SectionTitle: React.FC<SectionTitleProps> = ({
  children,
  topSubTitle,
  bottomSubTitle,
}) => {
  return (
    <div>
      {topSubTitle && <span className="section-title-top">{topSubTitle}</span>}
      <h2 className="section-title">{children}</h2>
      {bottomSubTitle && (
        <span className="section-title-bottom">{bottomSubTitle}</span>
      )}
    </div>
  );
};

export default SectionTitle;
