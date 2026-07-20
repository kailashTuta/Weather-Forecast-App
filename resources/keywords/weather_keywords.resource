*** Settings ***
Documentation    Business-level keywords for weather application tests.
...              These keywords orchestrate multiple page-object calls into
...              meaningful end-to-end actions.
Resource         ../pages/home_page.resource
Resource         ../pages/forecast_page.resource
Resource         ../pages/navigation.resource
Resource         ../variables/common_variables.resource
Library          SeleniumLibrary
Library          WeatherAPILibrary

*** Keywords ***

Open Browser To Home
    [Documentation]    Open ${BROWSER} and navigate to the Home page.
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Open Home Page

Search For City And View Forecast
    [Documentation]    End-to-end flow: open Home, enter city, submit, wait for forecast to load.
    ...                Parameters:
    ...                - ``city``  — city to search (default: ${DEFAULT_CITY})
    ...                - ``days``  — forecast days query param (default: 2)
    [Arguments]    ${city}=${DEFAULT_CITY}    ${days}=2
    Open Home Page
    Submit City And Navigate To Forecast    ${city}
    Wait For Spinner To Disappear
    Forecast Page Should Be Loaded

Verify Forecast Page Shows Correct City
    [Documentation]    Assert the Forecast page heading contains the expected city and country from the API.
    ...                Parameters:
    ...                - ``city`` — city name to verify
    [Arguments]    ${city}
    ${data}=    Get Forecast Data    ${city}    2
    ${api_city}=        Set Variable    ${data}[location][name]
    ${api_country}=     Set Variable    ${data}[location][country]
    Forecast Heading Should Contain City       ${api_city}
    Forecast Heading Should Contain Country    ${api_country}

Verify Current Weather Matches API
    [Documentation]    Compare displayed current weather values against a fresh API call for ``city``.
    ...                Parameters:
    ...                - ``city`` — city name to verify
    [Arguments]    ${city}
    ${data}=    Get Forecast Data    ${city}    2
    ${api_temp}=       Set Variable    ${data}[current][temp_c]
    ${api_humidity}=   Set Variable    ${data}[current][humidity]
    ${api_wind}=       Set Variable    ${data}[current][wind_kph]
    Page Should Contain    ${api_temp}
    Page Should Contain    ${api_humidity}
    Page Should Contain    ${api_wind}

Verify Forecast Card Count For Days
    [Documentation]    Navigate to /forecast?days=N and assert exactly N WeatherCards are shown.
    ...                Parameters:
    ...                - ``days`` — integer 1, 2, or 3
    [Arguments]    ${days}
    Open Forecast Page    ${days}
    Weather Cards Count Should Be    ${days}
    Forecast URL Should Contain Days    ${days}

Verify Days Selector Navigates Correctly
    [Documentation]    Click each days-selector button and assert the URL is updated to the correct ?days= value.
    [Arguments]    ${days}
    Wait Until Page Contains Element    ${DAYS_SELECTOR_BTNS}    timeout=${STANDARD_WAIT}
    ${btns}=    Get WebElements    ${DAYS_SELECTOR_BTNS}
    Click Element    ${btns}[${days - 1}]
    Wait For Spinner To Disappear
    Forecast URL Should Contain Days    ${days}
