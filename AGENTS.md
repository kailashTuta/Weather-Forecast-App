# AGENTS.md

## Project Overview

This project is a **Weather Forecast web application** migrated from AngularJS to **React 18** with React Router v6, Bootstrap 5, and Axios.  
The backend data source is the [WeatherAPI.com](https://www.weatherapi.com/) REST API.

### Tech Stack

| Layer | Technology |
|---|---|
| Frontend | React 18, React Router DOM v6, Bootstrap 5 |
| HTTP Client | Axios |
| State Management | React Context API (`CityContext`) |
| Build Tool | Create React App (`react-scripts 5`) |
| API | weatherapi.com — `/v1/forecast.json`, `/v1/current.json` |

### Source Structure

```
react-app/
  src/
    App.js                        # BrowserRouter + CityProvider + Routes
    components/
      Home.jsx                    # City input form → navigates to /forecast
      Forecast.jsx                # Forecast page — current weather + daily cards
      WeatherCard.jsx             # Single-day forecast card (memo)
      Navigation.jsx              # Navbar with Home link (memo)
    context/
      CityContext.js              # CityProvider + useCityContext hook
    hooks/
      useWeatherAPI.js            # Data-fetching hook with AbortController
    services/
      weatherService.js           # Axios wrapper: getForecast / getCurrentWeather
```

## Routes

| Path | Component | Notes |
|---|---|---|
| `/` | `Home` | City search form |
| `/forecast` | `Forecast` | Accepts `?days=1\|2\|3` query param |
| `*` | Inline 404 | Redirect link to `/` |

## Agent Responsibilities

1. Always follow Robot Framework best practices.
2. Follow the **Page Object Model** design pattern — one resource file per page.
3. Reuse existing keywords; never duplicate logic.
4. Use **explicit waits** (`Wait Until Element Is Visible`, `Wait Until Page Contains`).
5. Never use `Sleep` — use polling waits only.
6. Validate both **UI values** and **API response values** wherever the UI is data-driven.
7. Prefer selectors in priority order: `data-testid` → `id` → `name` → `aria-label` → CSS.
8. Avoid dynamic React-generated class names.
9. Support **CI/CD** execution and **Pabot parallel** execution.

## Framework Structure (Automation)

```
tests/
  smoke/
  regression/
  api/
  negative/
resources/
  pages/
    home_page.resource
    forecast_page.resource
    navigation.resource
  keywords/
    weather_keywords.resource
  variables/
    common_variables.resource
libraries/
  WeatherAPILibrary.py           # Python wrapper for weatherapi.com
reports/
```

## Selector Strategy

Priority order for Robot Framework locators:

1. `data-testid`
2. `id` (e.g., `id:cityInput` for the city text input)
3. `name`
4. `aria-label`
5. CSS selector

> The city input field has `id="cityInput"`. No `data-testid` attributes exist in the current codebase — add them if needed.

## React Testing Rules

- Wait for the spinner (`role=status`) to disappear before asserting weather data.
- Wait for API calls to complete using `Wait Until Element Is Not Visible` on the loading indicator.
- Validate that forecast cards are rendered after navigation to `/forecast`.
- Use `Wait Until Element Is Visible` for all dynamic content.
- Never use `Sleep`.

## Weather Validations

On the **Forecast page** (`/forecast`) validate:
- City/location name (`location.name`, `location.country`)
- Current temperature (`current.temp_c` in °C)
- Current humidity (`current.humidity` in %)
- Current wind speed (`current.wind_kph` in km/h)
- Weather condition text (`current.condition.text`)
- Number of forecast day cards matches requested `days` parameter
- Each `WeatherCard` shows: date, max temp, min temp, humidity, wind speed

On the **Home page** (`/`) validate:
- City input field is visible and accepts input
- Submit navigates to `/forecast`
- Empty / whitespace input does not navigate

## API Validation

Compare UI-displayed values against direct `weatherapi.com` API responses:

| Field | API Path | UI Location |
|---|---|---|
| City name | `location.name` | Forecast page heading |
| Country | `location.country` | Forecast page heading |
| Current temp | `current.temp_c` | Current Weather card |
| Humidity | `current.humidity` | Current Weather card |
| Wind speed | `current.wind_kph` | Current Weather card |
| Condition | `current.condition.text` | Current Weather card |
| Forecast count | `forecast.forecastday.length` | Number of WeatherCards |

API base URL: `https://api.weatherapi.com/v1`  
Key env var: `REACT_APP_WEATHER_API_KEY`

## CI/CD

Run the full test suite:
```bash
robot tests/
```

Run in parallel with Pabot:
```bash
pabot --processes 4 tests/
```

App runs on `http://localhost:3000` (default CRA dev server port).  
Start before running tests:
```bash
cd react-app && npm start
```
