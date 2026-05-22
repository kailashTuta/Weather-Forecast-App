import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useCityContext } from '../context/CityContext';

/**
 * Home Component
 * Migrated from: controllers/controllers.js - homeController
 * 
 * Original AngularJS Controller Logic:
 * - Used $scope.city bound to cityService
 * - Used $scope.$watch to sync city changes
 * - Used $location.path() for navigation
 * 
 * React Migration:
 * - Uses useCityContext hook for shared state
 * - Uses useState for local input state
 * - Uses useNavigate for routing
 */
const Home = () => {
  const { city, setCity } = useCityContext();
  const [inputValue, setInputValue] = useState(city);
  const navigate = useNavigate();

  /**
   * Handle form submission
   * Migrated from: $scope.submit function
   */
  const handleSubmit = (e) => {
    e.preventDefault();
    
    if (inputValue.trim()) {
      setCity(inputValue.trim());
      navigate('/forecast');
    }
  };

  /**
   * Handle input change
   * Replaces AngularJS two-way binding with controlled component
   */
  const handleInputChange = (e) => {
    setInputValue(e.target.value);
  };

  return (
    <div className="container mt-5">
      <div className="row justify-content-center">
        <div className="col-md-6">
          <div className="card shadow">
            <div className="card-body">
              <h2 className="card-title text-center mb-4">Weather Forecast</h2>
              <p className="text-muted text-center mb-4">
                Enter a city name to get the weather forecast
              </p>
              
              <form onSubmit={handleSubmit}>
                <div className="mb-3">
                  <label htmlFor="cityInput" className="form-label">
                    City Name
                  </label>
                  <input
                    type="text"
                    id="cityInput"
                    className="form-control form-control-lg"
                    value={inputValue}
                    onChange={handleInputChange}
                    placeholder="Enter city name (e.g., London, New York)"
                    required
                    autoFocus
                  />
                </div>
                
                <button 
                  type="submit" 
                  className="btn btn-primary btn-lg w-100"
                >
                  Get Forecast
                </button>
              </form>
              
              {city && (
                <div className="mt-3 text-center">
                  <small className="text-muted">
                    Current city: <strong>{city}</strong>
                  </small>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Home;

// Made with Bob
