*** Settings ***
Documentation    Smoke tests — verify the most critical, end-to-end happy paths
...              of the Weather Forecast application.
Resource         ../../resources/keywords/weather_keywords.resource
Suite Setup      Open Browser To Home
Suite Teardown   Close Browser
Test Tags        smoke

*** Test Cases ***

Home Page Loads And Displays City Input Form
    [Documentation]    Verify that navigating to / shows the Home page with the city input field.
    Open Home Page
    Home Page Should Be Loaded
    City Input Should Be Visible

City Submission Navigates To Forecast Page
    [Documentation]    Verify that submitting a valid city name from the Home page
    ...                redirects the browser to the /forecast route.
    Open Home Page
    Submit City And Navigate To Forecast    ${DEFAULT_CITY}
    Location Should Contain    /forecast

Forecast Page Loads And Displays Weather Data
    [Documentation]    Verify that the Forecast page loads and renders weather data
    ...                for the default city (Eluru).
    Open Home Page
    Search For City And View Forecast    ${DEFAULT_CITY}
    Forecast Page Should Be Loaded
    Forecast Heading Should Contain City    Eluru
