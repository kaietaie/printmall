import React from 'react';
import squish from '../Helpers/ClassNameHelper';
import './Badge.sass';

interface BadgeProps {
  content: number;
  className?: string;
  children: React.ReactNode;
}

const Badge: React.FC<BadgeProps> = ({
  content = 0,
  children,
  className = ''
}) => {
  if (!content) {
    return <>{children}</>;
  }

  const finalContent = content >= 100 ? '99+' : content;

  return (
    <div
      className={squish`
      badge-container
      ${className}
    `}>
      <span className="badge">{finalContent}</span>
      {children}
    </div>
  );
};

export default Badge;
