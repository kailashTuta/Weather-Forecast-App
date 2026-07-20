*** Settings ***
Documentation    Common variables shared across all test suites.

*** Variables ***
# Application
${BASE_URL}             http://localhost:3000
${BROWSER}              chrome

# Default test data
${DEFAULT_CITY}         Eluru
${INVALID_CITY}         ThisCityDoesNotExist99999

# API
${API_BASE_URL}         https://api.weatherapi.com/v1
${API_KEY}              %{REACT_APP_WEATHER_API_KEY}

# Timeouts
${SHORT_WAIT}           5s
${STANDARD_WAIT}        10s
${LONG_WAIT}            20s

# Locators (CSS / ID)
${CITY_INPUT}           id:cityInput
${SUBMIT_BUTTON}        css:button[type="submit"]
${SPINNER}              css:.spinner-border
${FORECAST_HEADING}     css:h2
${WEATHER_CARDS}        css:.col-md-6.mb-4
${NAVBAR_BRAND}         css:.navbar-brand
${DAYS_SELECTOR_BTNS}   css:.btn-group a.btn
${ERROR_ALERT}          css:.alert-danger
${WARNING_ALERT}        css:.alert-warning
