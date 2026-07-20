*** Settings ***
Documentation    API tests — validate weatherapi.com responses directly without a browser.
...              Tests confirm HTTP status, response structure, and data integrity.
Library          WeatherAPILibrary
Resource         ../../resources/variables/common_variables.resource
Test Tags        api

*** Test Cases ***

Forecast Endpoint Returns HTTP 200 For Default City
    [Documentation]    Assert GET /v1/forecast.json?q=Eluru&days=2 returns HTTP 200.
    Forecast Response Should Be OK    ${DEFAULT_CITY}    2

Forecast Response Contains Required Top-Level Keys
    [Documentation]    Assert the forecast JSON body contains "location", "current",
    ...                and "forecast" keys.
    ${data}=    Get Forecast Data    ${DEFAULT_CITY}    2
    Dictionary Should Contain Key    ${data}    location
    Dictionary Should Contain Key    ${data}    current
    Dictionary Should Contain Key    ${data}    forecast

Forecast Response Contains Forecastday Array
    [Documentation]    Assert that "forecast.forecastday" exists and is a non-empty list.
    ${data}=    Get Forecast Data    ${DEFAULT_CITY}    2
    ${forecastday}=    Set Variable    ${data}[forecast][forecastday]
    Should Not Be Empty    ${forecastday}

Forecast Forecastday Length Matches Requested Days=1
    [Documentation]    Assert that requesting days=1 returns exactly 1 forecastday entry.
    ${data}=    Get Forecast Data    ${DEFAULT_CITY}    1
    ${forecastday}=    Set Variable    ${data}[forecast][forecastday]
    Length Should Be    ${forecastday}    1

Forecast Forecastday Length Matches Requested Days=2
    [Documentation]    Assert that requesting days=2 returns exactly 2 forecastday entries.
    ${data}=    Get Forecast Data    ${DEFAULT_CITY}    2
    ${forecastday}=    Set Variable    ${data}[forecast][forecastday]
    Length Should Be    ${forecastday}    2

Forecast Forecastday Length Matches Requested Days=3
    [Documentation]    Assert that requesting days=3 returns exactly 3 forecastday entries.
    ${data}=    Get Forecast Data    ${DEFAULT_CITY}    3
    ${forecastday}=    Set Variable    ${data}[forecast][forecastday]
    Length Should Be    ${forecastday}    3

Forecast Response Contains Current Temp
    [Documentation]    Assert the "current.temp_c" field is present in the forecast response.
    ${data}=    Get Forecast Data    ${DEFAULT_CITY}    2
    Dictionary Should Contain Key    ${data}[current]    temp_c

Forecast Response Contains Current Humidity
    [Documentation]    Assert the "current.humidity" field is present in the forecast response.
    ${data}=    Get Forecast Data    ${DEFAULT_CITY}    2
    Dictionary Should Contain Key    ${data}[current]    humidity

Forecast Response Contains Current Wind Speed
    [Documentation]    Assert the "current.wind_kph" field is present in the forecast response.
    ${data}=    Get Forecast Data    ${DEFAULT_CITY}    2
    Dictionary Should Contain Key    ${data}[current]    wind_kph

Forecast Location Name Matches Default City
    [Documentation]    Assert "location.name" in the API response matches the city queried (Eluru).
    ${data}=    Get Forecast Data    ${DEFAULT_CITY}    2
    ${location_name}=    Set Variable    ${data}[location][name]
    Should Be Equal As Strings    ${location_name}    Eluru

Current Weather Endpoint Returns HTTP 200
    [Documentation]    Assert GET /v1/current.json?q=Eluru returns HTTP 200.
    Current Weather Response Should Be OK    ${DEFAULT_CITY}

Current Weather Response Contains Current Block
    [Documentation]    Assert GET /v1/current.json response body contains the "current" key.
    ${data}=    Get Current Weather Data    ${DEFAULT_CITY}
    Dictionary Should Contain Key    ${data}    current
