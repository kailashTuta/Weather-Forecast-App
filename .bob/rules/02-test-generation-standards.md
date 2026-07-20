# Weather Application Automation Standards

## Application Under Test

React 18 SPA — `http://localhost:3000`  
Pages: **Home** (`/`) and **Forecast** (`/forecast?days=1|2|3`)  
API: `https://api.weatherapi.com/v1`  
Key: env var `REACT_APP_WEATHER_API_KEY`

## Test Coverage Requirements

### Smoke
- Home page loads and displays the city input form
- City submission navigates to `/forecast`
- Forecast page loads and displays weather data for the default city (Eluru)

### Regression
- `?days=1`, `?days=2`, `?days=3` each render the correct number of `WeatherCard` components
- Forecast heading shows the correct city name and country
- Current Weather section displays temperature (°C), humidity (%), and wind speed (km/h)
- Each WeatherCard displays: date, condition text, max temp, min temp, humidity, wind speed
- Days selector buttons are present and navigate to the correct `?days=` URL
- Navigation "Weather Forecast" brand link returns to `/`
- 404 route displays the "Page Not Found" alert with a "Go Home" link

### API
- `GET /v1/forecast.json?q=<city>&days=<n>` returns HTTP 200
- Response body contains `location`, `current`, and `forecast.forecastday`
- `forecast.forecastday` length equals the requested `days` parameter
- `current.temp_c`, `current.humidity`, `current.wind_kph` match values shown in the UI
- `location.name` matches the city heading shown on the Forecast page
- `GET /v1/current.json?q=<city>` returns HTTP 200 with `current` block

### Negative
- Invalid city name returns an error alert on the Forecast page
- Empty/whitespace-only city input does not navigate away from Home
- Missing API key or invalid key results in a visible error message (not a blank page)

## Documentation

- Every test case must have a `[Documentation]` tag describing its purpose.
- Every keyword must have a `[Documentation]` tag describing its parameters and behaviour.

## Maintainability

- One page resource file per page:
  - `resources/pages/home_page.resource`
  - `resources/pages/forecast_page.resource`
  - `resources/pages/navigation.resource`
- Business-level keywords are separate from page-object keywords:
  - `resources/keywords/weather_keywords.resource`
- All weatherapi.com HTTP calls are encapsulated in `libraries/WeatherAPILibrary.py`.
- Common variables (base URL, API key, default city) live in `resources/variables/common_variables.resource`.

## Locator Notes (React-specific)

| Element | Best Locator |
|---|---|
| City input | `id:cityInput` |
| Submit button | `css:button[type="submit"]` |
| Loading spinner | `css:.spinner-border` |
| Forecast heading | `css:h2` (contains city + country) |
| Current temp | `css:.card-body h3` (first match) |
| Weather cards | `css:.col-md-6.mb-4` |
| Navbar brand | `css:.navbar-brand` |
| Days selector buttons | `css:.btn-group a.btn` |

Add `data-testid` attributes to components when a stable locator is needed.
