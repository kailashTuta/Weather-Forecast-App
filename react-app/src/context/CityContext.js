import { createContext, useState, useContext } from 'react';

/**
 * CityContext - Migrated from AngularJS cityService
 * Original: services/services.js
 * 
 * This context replaces the AngularJS service pattern with React Context API
 * for sharing city state across components.
 */
const CityContext = createContext();

export const CityProvider = ({ children }) => {
  // Default city value migrated from original cityService
  const [city, setCity] = useState('Eluru');

  const value = {
    city,
    setCity
  };

  return (
    <CityContext.Provider value={value}>
      {children}
    </CityContext.Provider>
  );
};

/**
 * Custom hook to use the CityContext
 * Replaces AngularJS dependency injection of cityService
 */
export const useCityContext = () => {
  const context = useContext(CityContext);
  if (!context) {
    throw new Error('useCityContext must be used within a CityProvider');
  }
  return context;
};

export default CityContext;

// Made with Bob
