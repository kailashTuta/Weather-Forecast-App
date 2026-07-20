# Robot Framework Automation Generation Rules

## Stack
- Robot Framework + SeleniumLibrary + RequestsLibrary
- Python 3.11+
- pabot for parallel execution
- Target app: React 18 SPA at `http://localhost:3000`

## Page Object Model
- One `.resource` file per page: `home_page.resource`, `forecast_page.resource`, `navigation.resource`
- Business-level keywords live in `resources/keywords/weather_keywords.resource`
- API interaction logic lives in `libraries/WeatherAPILibrary.py`
- Tests import resources, never call SeleniumLibrary keywords directly from test cases

## Selector Priority
1. `data-testid` attribute
2. `id` — the city input uses `id="cityInput"`
3. `name`
4. `aria-label` — the loading spinner uses `role="status"`
5. CSS selector
- Never use XPath unless no other locator works
- Never target dynamic React-generated class names

## Waits & Timing
- Use `Wait Until Element Is Visible` / `Wait Until Element Is Not Visible`
- Use `Wait Until Page Contains` / `Wait Until Page Contains Element`
- Wait for the Bootstrap spinner (`css:.spinner-border`) to disappear before asserting weather data
- Never use `Sleep`

## API Calls
- Call `https://api.weatherapi.com/v1/forecast.json` with `key`, `q`, and `days` params
- Call `https://api.weatherapi.com/v1/current.json` with `key` and `q` params
- Encapsulate all requests in `WeatherAPILibrary.py` using the `requests` library
- Read the API key from environment variable `REACT_APP_WEATHER_API_KEY`
- Generate API validation tests whenever a UI page is driven by API data (Forecast page)

## App Routes to Test
| Route | Component | Query Params |
|---|---|---|
| `/` | Home | — |
| `/forecast` | Forecast | `?days=1`, `?days=2`, `?days=3` |

## Pabot Compatibility
- Each test file must be independently executable
- Use `Suite Setup` / `Suite Teardown` with `Open Browser` / `Close Browser`
- Do not share browser state between test suites
- Use `pabot --processes 4 tests/` for parallel runs
