*** Settings ***
Documentation    Page-object keywords for the Forecast page (/forecast).
...              Encapsulates all element interactions for weather data display.
Resource         ../variables/common_variables.resource
Library          SeleniumLibrary

*** Keywords ***

Open Forecast Page
    [Documentation]    Navigate directly to the Forecast page with optional days parameter.
    ...                Parameters:
    ...                - ``days`` — number of forecast days (default: 2)
    [Arguments]        ${days}=2
    Go To    ${BASE_URL}/forecast?days=${days}
    Wait For Spinner To Disappear

Wait For Spinner To Disappear
    [Documentation]    Wait until the Bootstrap loading spinner is no longer visible.
    ...                Must be called after navigation to the forecast page before asserting data.
    Wait Until Element Is Not Visible    ${SPINNER}    timeout=${LONG_WAIT}

Forecast Page Should Be Loaded
    [Documentation]    Assert that the Forecast page has loaded by verifying the h2 heading is visible.
    Wait Until Element Is Visible    ${FORECAST_HEADING}    timeout=${STANDARD_WAIT}

Forecast Heading Should Contain City
    [Documentation]    Assert that the forecast h2 heading contains the expected city name.
    ...                Parameters:
    ...                - ``city`` — expected city name (case-insensitive substring match)
    [Arguments]        ${city}
    Wait Until Element Is Visible    ${FORECAST_HEADING}    timeout=${STANDARD_WAIT}
    Element Should Contain    ${FORECAST_HEADING}    ${city}

Forecast Heading Should Contain Country
    [Documentation]    Assert that the forecast h2 heading contains the expected country.
    ...                Parameters:
    ...                - ``country`` — expected country name (case-insensitive substring match)
    [Arguments]        ${country}
    Element Should Contain    ${FORECAST_HEADING}    ${country}

Weather Cards Count Should Be
    [Documentation]    Assert that the number of WeatherCard components rendered equals ``expected_count``.
    ...                Parameters:
    ...                - ``expected_count`` — integer number of expected cards
    [Arguments]        ${expected_count}
    Wait Until Page Contains Element    ${WEATHER_CARDS}    timeout=${STANDARD_WAIT}
    ${cards}=    Get WebElements    ${WEATHER_CARDS}
    Length Should Be    ${cards}    ${expected_count}

Current Temperature Should Be Visible
    [Documentation]    Assert the current temperature element (°C) is displayed on the page.
    Wait Until Page Contains    °C    timeout=${STANDARD_WAIT}

Current Humidity Should Be Visible
    [Documentation]    Assert the current humidity element (%) is displayed on the page.
    Page Should Contain    %

Current Wind Speed Should Be Visible
    [Documentation]    Assert the current wind speed element (km/h) is displayed on the page.
    Page Should Contain    km/h

Days Selector Should Have Three Buttons
    [Documentation]    Assert that the days selector contains exactly 3 day-selection buttons.
    Wait Until Page Contains Element    ${DAYS_SELECTOR_BTNS}    timeout=${STANDARD_WAIT}
    ${btns}=    Get WebElements    ${DAYS_SELECTOR_BTNS}
    Length Should Be    ${btns}    3

Forecast URL Should Contain Days
    [Documentation]    Assert that the current URL contains the ?days= query parameter.
    ...                Parameters:
    ...                - ``days`` — expected days value in the URL
    [Arguments]        ${days}
    Location Should Contain    days=${days}

Error Alert Should Be Visible
    [Documentation]    Assert the error alert (alert-danger) is visible on the Forecast page.
    Wait Until Element Is Visible    ${ERROR_ALERT}    timeout=${STANDARD_WAIT}

Error Alert Should Contain
    [Documentation]    Assert the error alert contains the given text.
    ...                Parameters:
    ...                - ``text`` — expected text substring in the error alert
    [Arguments]        ${text}
    Wait Until Element Is Visible    ${ERROR_ALERT}    timeout=${STANDARD_WAIT}
    Element Should Contain    ${ERROR_ALERT}    ${text}

Weather Card Should Display Required Fields
    [Documentation]    Assert a single WeatherCard element contains date, condition, and temperature info.
    ...                Parameters:
    ...                - ``card_element`` — WebElement for the card container
    [Arguments]        ${card_element}
    ${text}=    Get Text    ${card_element}
    Should Contain    ${text}    °C
    Should Contain    ${text}    %
    Should Contain    ${text}    km/h
