# AngularJS Weather Forecast App

This is the legacy AngularJS version of the Weather Forecast application. This application has been migrated to React (see `/react-app` directory).

## Overview

A simple weather forecast application built with AngularJS 1.8.2 that allows users to search for weather information by city name and view multi-day forecasts.

## Features

- 🌤️ Search weather by city name
- 📅 Multi-day weather forecast (default: 2 days)
- 🎨 Bootstrap 4 UI
- 📱 Responsive design
- 🔄 Real-time weather data from WeatherAPI.com

## Technology Stack

- **Framework:** AngularJS 1.8.2
- **Routing:** ngRoute
- **HTTP:** ngResource
- **UI Framework:** Bootstrap 4.5.2
- **API:** WeatherAPI.com

## Project Structure

```
angularjs-app/
├── app.js                      # Main application module
├── config.js                   # Configuration (API keys, settings)
├── routes.js                   # Route definitions
├── directives.js               # Custom directives
├── index.html                  # Main HTML file
├── controllers/
│   └── controllers.js          # Application controllers
├── services/
│   └── services.js             # Application services
├── directives/
│   ├── weatherForecast.html    # Weather forecast directive template
│   └── weatherReport.html      # Weather report directive template
└── pages/
    ├── home.html               # Home page template
    └── forecast.html           # Forecast page template
```

## Setup Instructions

### Prerequisites

- A modern web browser
- WeatherAPI.com API key (free tier available)

### Configuration

1. **Get API Key:**
   - Sign up at [WeatherAPI.com](https://www.weatherapi.com/)
   - Get your free API key

2. **Configure the Application:**
   - Open `config.js`
   - Replace the `WEATHER_API_KEY` with your API key:
   ```javascript
   var APP_CONFIG = {
     WEATHER_API_KEY: 'your-api-key-here',
     WEATHER_API_BASE_URL: 'https://api.weatherapi.com/v1',
     DEFAULT_FORECAST_DAYS: 2
   };
   ```

3. **Environment Variables (Optional):**
   - Copy `.env.example` to `.env`
   - Set your API key in the `.env` file

### Running the Application

#### Option 1: Simple HTTP Server

```bash
# Using Python 3
python -m http.server 8000

# Using Python 2
python -m SimpleHTTPServer 8000

# Using Node.js http-server
npx http-server -p 8000
```

Then open `http://localhost:8000` in your browser.

#### Option 2: Docker

```bash
# Build the Docker image
docker build -t angularjs-weather-app .

# Run the container
docker run -p 8080:80 angularjs-weather-app
```

Then open `http://localhost:8080` in your browser.

## Application Components

### Controllers

- **homeController:** Manages the home page and city input
- **forecastController:** Handles weather forecast data retrieval and display

### Services

- **cityService:** Shared service for storing the selected city across controllers

### Directives

- Custom directives for weather display components

### Routes

- `/` - Home page (city search)
- `/forecast` - Weather forecast display
- `/forecast/:days` - Weather forecast with custom number of days

## API Integration

The application uses the WeatherAPI.com Forecast API:

**Endpoint:** `https://api.weatherapi.com/v1/forecast.json`

**Parameters:**
- `key`: API key
- `q`: City name
- `days`: Number of forecast days (1-10)

## Features in Detail

### City Search
- Input validation for empty city names
- Error handling for invalid cities
- Persistent city selection across navigation

### Weather Forecast
- Current weather conditions
- Multi-day forecast
- Temperature, humidity, wind speed
- Weather condition icons
- Loading states
- Error handling

## Migration to React

This AngularJS application has been migrated to React. See the `/react-app` directory for the modern React implementation with:
- React 18
- React Router v6
- Context API for state management
- Custom hooks
- Modern JavaScript (ES6+)
- Improved performance and maintainability

For migration details, see:
- `/react-app/MIGRATION_GUIDE.md`
- `/react-app/MIGRATION_TRACKING.json`

## Known Limitations

- Uses AngularJS 1.x (no longer in active development)
- JSONP for API calls (less secure than modern approaches)
- Global configuration object
- Limited error handling
- No unit tests included

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Security Notes

⚠️ **Important Security Considerations:**

1. **API Key Exposure:** The API key is currently stored in `config.js` which is client-side. In production:
   - Use a backend proxy to hide the API key
   - Implement proper environment variable handling
   - Never commit API keys to version control

2. **JSONP:** The application uses JSONP for cross-origin requests. Consider:
   - Using CORS-enabled endpoints
   - Implementing a backend proxy
   - Using modern fetch API with proper CORS handling

## Troubleshooting

### Weather data not loading
- Check your API key is valid
- Verify the city name is correct
- Check browser console for errors
- Ensure you have internet connectivity

### CORS errors
- The application uses JSONP to avoid CORS issues
- If you see CORS errors, check the API endpoint configuration

## License

This project is part of the Weather Forecast App migration demonstration.

## Related Documentation

- [Functional Requirements](/docs/functional-requirements.md)
- [Non-Functional Requirements](/docs/non-functional-requirements.md)
- [React Migration Guide](/react-app/MIGRATION_GUIDE.md)
- [Migration Ontology](/angularjs-to-react-migration-ontology.jsonld)

---

**Note:** This is the legacy version. For new development, please use the React application in `/react-app`.