import React from 'react';
import ReactDOM from 'react-dom/client';
import 'bootstrap/dist/css/bootstrap.min.css';
import App from './App';

/**
 * React Application Entry Point
 * Migrated from: index.html
 * 
 * Original AngularJS Bootstrap:
 * - ng-app="weatherApp" on <html> tag
 * - Manual script loading of Angular and modules
 * 
 * React Migration:
 * - Uses ReactDOM.createRoot for React 18
 * - Mounts App component to root element
 */

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// Made with Bob
