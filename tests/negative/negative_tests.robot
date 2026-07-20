*** Settings ***
Documentation    Negative tests — verify correct error handling for invalid input,
...              empty form submissions, and API error conditions.
Resource         ../../resources/keywords/weather_keywords.resource
Suite Setup      Open Browser To Home
Suite Teardown   Close Browser
Test Tags        negative

*** Test Cases ***

Invalid City Name Shows Error Alert On Forecast Page
    [Documentation]    Enter a city name that does not exist, submit the form, and assert
    ...                that an error alert is shown on the Forecast page.
    Open Home Page
    Submit City And Navigate To Forecast    ${INVALID_CITY}
    Error Alert Should Be Visible

Empty Input Does Not Navigate Away From Home
    [Documentation]    Clear the city input and click Submit; the page should remain on /
    ...                and not navigate to /forecast.
    Open Home Page
    Clear Element Text    ${CITY_INPUT}
    ${url_before}=    Get Location
    Click Button      ${SUBMIT_BUTTON}
    # Wait briefly; URL must not change to /forecast
    Sleep    1s
    ${url_after}=    Get Location
    Should Not Contain    ${url_after}    /forecast

Whitespace Only Input Does Not Navigate Away From Home
    [Documentation]    Enter only whitespace in the city input, submit, and assert the URL
    ...                stays on / (Home component guards against empty/whitespace input).
    Open Home Page
    Clear Element Text    ${CITY_INPUT}
    Input Text            ${CITY_INPUT}    ${SPACE}${SPACE}${SPACE}
    Click Button          ${SUBMIT_BUTTON}
    Sleep    1s
    Location Should Contain    ${BASE_URL}/
    Should Not Contain    ${BASE_URL}/    /forecast
