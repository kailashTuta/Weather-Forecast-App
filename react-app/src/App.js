import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { CityProvider } from './context/CityContext';
import Navigation from './components/Navigation';
import Home from './components/Home';
import Forecast from './components/Forecast';

/**
 * Main App Component
 * Migrated from: app.js and routes.js
 * 
 * Original AngularJS Setup:
 * - angular.module("weatherApp", ["ngRoute", "ngResource"])
 * - $routeProvider configuration in routes.js
 * 
 * React Migration:
 * - BrowserRouter replaces ngRoute
 * - Routes and Route replace $routeProvider
 * - CityProvider wraps the app for global state
 */
function App() {
  return (
    <BrowserRouter>
      <CityProvider>
        <div className="App">
          <Navigation />
          
          <Routes>
            {/* Home Route - Migrated from routes.js "/" */}
            <Route 
              path="/" 
              element={<Home />} 
            />
            
            {/* Forecast Route - Migrated from routes.js "/forecast" */}
            <Route 
              path="/forecast" 
              element={<Forecast />} 
            />
            
            {/* 404 Not Found Route */}
            <Route 
              path="*" 
              element={
                <div className="container mt-5">
                  <div className="alert alert-warning" role="alert">
                    <h4 className="alert-heading">Page Not Found</h4>
                    <p>The page you're looking for doesn't exist.</p>
                    <hr />
                    <a href="/" className="btn btn-primary">Go Home</a>
                  </div>
                </div>
              }
            />
          </Routes>
        </div>
      </CityProvider>
    </BrowserRouter>
  );
}

export default App;

// Made with Bob
