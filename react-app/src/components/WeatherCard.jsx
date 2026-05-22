import { memo } from 'react';

/**
 * WeatherCard Component
 * Migrated from: directives/weatherForecast.html and directives/weatherReport.html
 *
 * This component replaces AngularJS directives with a reusable React component
 * for displaying weather forecast information for a single day.
 *
 * Performance: Wrapped with React.memo to prevent unnecessary re-renders
 */
const WeatherCard = memo(({ dayData }) => {
  if (!dayData) {
    return null;
  }

  const { date, day } = dayData;
  const { condition, maxtemp_c, mintemp_c, avghumidity, maxwind_kph } = day;

  // Format date for better display
  const formatDate = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { 
      weekday: 'long', 
      year: 'numeric', 
      month: 'long', 
      day: 'numeric' 
    });
  };

  return (
    <div className="col-md-6 mb-4">
      <div className="card h-100 shadow-sm">
        <div className="card-body">
          <h5 className="card-title text-primary">
            {formatDate(date)}
          </h5>
          
          <div className="text-center my-3">
            <img 
              src={condition.icon} 
              alt={condition.text}
              className="weather-icon"
              style={{ width: '64px', height: '64px' }}
            />
            <p className="h6 mt-2">{condition.text}</p>
          </div>

          <div className="weather-details">
            <div className="row mb-2 align-items-center">
              <div className="col-6">
                <strong>Max Temp:</strong>
              </div>
              <div className="col-6 text-end">
                <span className="badge rounded-pill bg-danger">{maxtemp_c}°C</span>
              </div>
            </div>

            <div className="row mb-2 align-items-center">
              <div className="col-6">
                <strong>Min Temp:</strong>
              </div>
              <div className="col-6 text-end">
                <span className="badge rounded-pill bg-info text-dark">{mintemp_c}°C</span>
              </div>
            </div>

            <div className="row mb-2 align-items-center">
              <div className="col-6">
                <strong>Humidity:</strong>
              </div>
              <div className="col-6 text-end">
                <span className="badge rounded-pill bg-secondary">{avghumidity}%</span>
              </div>
            </div>

            <div className="row align-items-center">
              <div className="col-6">
                <strong>Wind Speed:</strong>
              </div>
              <div className="col-6 text-end">
                <span className="badge rounded-pill bg-primary">{maxwind_kph} km/h</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
});

WeatherCard.displayName = 'WeatherCard';

export default WeatherCard;

// Made with Bob
