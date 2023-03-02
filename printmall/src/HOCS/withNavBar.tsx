import React from 'react';
import NavBar from '../components/NavBar';

interface Props<T extends object> {
  wrappedComponent: React.ComponentType<T>;
}

function withNavBar<T extends object>({
  wrappedComponent: WrappedComponent,
}: Props<T>) {
  return function WithNavBar(props: T) {
    return (
      <>
        <NavBar />
        <WrappedComponent {...props} />
      </>
    );
  };
}

export default withNavBar;
