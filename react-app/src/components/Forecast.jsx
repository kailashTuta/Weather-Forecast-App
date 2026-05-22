import { useSearchParams, Link } from 'react-router-dom';
import { useCityContext } from '../context/CityContext';
import { useWeatherAPI } from '../hooks/useWeatherAPI';
import WeatherCard from './WeatherCard';

/**
 * Forecast Component
 * Migrated from: controllers/controllers.js - forecastController
 * 
 * Original AngularJS Controller Logic:
 * - Used $scope.city from cityService
 * - Used $routeParams.days for forecast days
 * - Used $resource for API calls
 * - Bound weatherResult to $scope
 * 
 * React Migration:
 * - Uses useCityContext hook for city state
 * - Uses useSearchParams for URL parameters
 * - Uses useWeatherAPI custom hook for data fetching
 * - Manages loading and error states
 */
const Forecast = () => {
  const { city } = useCityContext();
  const [searchParams] = useSearchParams();
  const days = parseInt(searchParams.get('days')) || 2;

  // Use custom hook to fetch weather data
  const { weatherData, loading, error } = useWeatherAPI(city, days);

  /**
   * Loading State
   * Replaces AngularJS promise handling
   */
  if (loading) {
    return (
      <div className="container mt-5">
        <div className="text-center">
          <div className="spinner-border text-primary" role="status">
            <span className="visually-hidden">Loading...</span>
          </div>
          <p className="mt-3">Loading weather data for {city}...</p>
        </div>
      </div>
    );
  }

  /**
   * Error State
   * Enhanced error handling compared to AngularJS version
   */
  if (error) {
    return (
      <div className="container mt-5">
        <div className="alert alert-danger" role="alert">
          <h4 className="alert-heading">Error!</h4>
          <p>{error}</p>
          <hr />
          <Link to="/" className="btn btn-primary">
            Go Back to Home
          </Link>
        </div>
      </div>
    );
  }

  /**
   * No Data State
   */
  if (!weatherData) {
    return (
      <div className="container mt-5">
        <div className="alert alert-warning" role="alert">
          <h4 className="alert-heading">No Data Available</h4>
          <p>Please select a city from the home page.</p>
          <Link to="/" className="btn btn-primary">
            Go to Home
          </Link>
        </div>
      </div>
    );
  }

  const { location, forecast } = weatherData;

  return (
    <div className="container mt-4">
      {/* Header Section */}
      <div className="row mb-4">
        <div className="col-12">
          <div className="d-flex justify-content-between align-items-center">
            <div>
              <h2 className="mb-1">
                Weather Forecast for {location.name}, {location.country}
              </h2>
              <p className="text-muted mb-0">
                {location.region} | Local Time: {location.localtime}
              </p>
            </div>
            <Link to="/" className="btn btn-outline-primary">
              Change City
            </Link>
          </div>
        </div>
      </div>

      {/* Current Weather Section */}
      {weatherData.current && (
        <div className="row mb-4">
          <div className="col-12">
            <div className="card shadow-sm">
              <div className="card-body">
                <h4 className="card-title">Current Weather</h4>
                <div className="row align-items-center">
                  <div className="col-md-3 text-center">
                    <img 
                      src={weatherData.current.condition.icon} 
                      alt={weatherData.current.condition.text}
                      style={{ width: '80px', height: '80px' }}
                    />
                    <p className="mb-0">{weatherData.current.condition.text}</p>
                  </div>
                  <div className="col-md-9">
                    <div className="row g-3">
                      <div className="col-md-4">
                        <h3 className="mb-0">{weatherData.current.temp_c}°C</h3>
                        <small className="text-muted">Temperature</small>
                      </div>
                      <div className="col-md-4">
                        <h5 className="mb-0">{weatherData.current.humidity}%</h5>
                        <small className="text-muted">Humidity</small>
                      </div>
                      <div className="col-md-4">
                        <h5 className="mb-0">{weatherData.current.wind_kph} km/h</h5>
                        <small className="text-muted">Wind Speed</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Forecast Section */}
      <div className="row mb-4">
        <div className="col-12">
          <h4 className="mb-3">{days}-Day Forecast</h4>
        </div>
      </div>

      {/* Weather Cards */}
      <div className="row">
        {forecast.forecastday.map((dayData, index) => (
          <WeatherCard key={index} dayData={dayData} />
        ))}
      </div>

      {/* Days Selector */}
      <div className="row mt-4">
        <div className="col-12">
          <div className="card">
            <div className="card-body">
              <h5 className="card-title">Change Forecast Duration</h5>
              <div className="btn-group" role="group">
                <Link 
                  to={`/forecast?days=1`} 
                  className={`btn ${days === 1 ? 'btn-primary' : 'btn-outline-primary'}`}
                >
                  1 Day
                </Link>
                <Link 
                  to={`/forecast?days=2`} 
                  className={`btn ${days === 2 ? 'btn-primary' : 'btn-outline-primary'}`}
                >
                  2 Days
                </Link>
                <Link 
                  to={`/forecast?days=3`} 
                  className={`btn ${days === 3 ? 'btn-primary' : 'btn-outline-primary'}`}
                >
                  3 Days
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Forecast;

// Made with Bob
