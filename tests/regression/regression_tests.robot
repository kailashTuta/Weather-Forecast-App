*** Settings ***
Documentation    Regression tests — thorough coverage of the Forecast page,
...              WeatherCard rendering, navigation, and day-selector behaviour.
Resource         ../../resources/keywords/weather_keywords.resource
Suite Setup      Open Browser To Home
Suite Teardown   Close Browser
Test Tags        regression

*** Test Cases ***

Forecast With Days=1 Renders One WeatherCard
    [Documentation]    Navigate to /forecast?days=1 and assert exactly one WeatherCard is displayed.
    Verify Forecast Card Count For Days    1

Forecast With Days=2 Renders Two WeatherCards
    [Documentation]    Navigate to /forecast?days=2 and assert exactly two WeatherCards are displayed.
    Verify Forecast Card Count For Days    2

Forecast With Days=3 Renders Three WeatherCards
    [Documentation]    Navigate to /forecast?days=3 and assert exactly three WeatherCards are displayed.
    Verify Forecast Card Count For Days    3

Forecast Heading Shows City Name And Country
    [Documentation]    Navigate to the Forecast page and verify the h2 heading contains
    ...                the city name and country obtained from the API.
    Search For City And View Forecast    ${DEFAULT_CITY}
    Verify Forecast Page Shows Correct City    ${DEFAULT_CITY}

Current Weather Section Displays Temperature
    [Documentation]    Assert the Current Weather card shows a temperature value in °C.
    Search For City And View Forecast    ${DEFAULT_CITY}
    Current Temperature Should Be Visible

Current Weather Section Displays Humidity
    [Documentation]    Assert the Current Weather card shows a humidity percentage value.
    Search For City And View Forecast    ${DEFAULT_CITY}
    Current Humidity Should Be Visible

Current Weather Section Displays Wind Speed
    [Documentation]    Assert the Current Weather card shows a wind speed in km/h.
    Search For City And View Forecast    ${DEFAULT_CITY}
    Current Wind Speed Should Be Visible

Each WeatherCard Displays Required Fields
    [Documentation]    Assert every rendered WeatherCard contains date, max/min temperature (°C),
    ...                humidity (%), and wind speed (km/h).
    Open Forecast Page    3
    ${cards}=    Get WebElements    ${WEATHER_CARDS}
    FOR    ${card}    IN    @{cards}
        Weather Card Should Display Required Fields    ${card}
    END

Days Selector Buttons Are Present
    [Documentation]    Assert that exactly three day-selector buttons are visible on the Forecast page.
    Open Forecast Page    2
    Days Selector Should Have Three Buttons

Days Selector 1 Day Button Navigates To Correct URL
    [Documentation]    Click the "1 Day" button and verify the URL contains ?days=1.
    Open Forecast Page    2
    Verify Days Selector Navigates Correctly    1

Days Selector 2 Days Button Navigates To Correct URL
    [Documentation]    Click the "2 Days" button and verify the URL contains ?days=2.
    Open Forecast Page    1
    Verify Days Selector Navigates Correctly    2

Days Selector 3 Days Button Navigates To Correct URL
    [Documentation]    Click the "3 Days" button and verify the URL contains ?days=3.
    Open Forecast Page    1
    Verify Days Selector Navigates Correctly    3

Navbar Brand Link Returns To Home Page
    [Documentation]    Verify that clicking the "Weather Forecast" navbar brand navigates back to /.
    Open Forecast Page    2
    Clicking Navbar Brand Navigates To Home
    Home Page Should Be Loaded

404 Route Displays Page Not Found Alert
    [Documentation]    Navigate to an unknown route and assert the "Page Not Found" alert is shown
    ...                with a "Go Home" link.
    Go To    ${BASE_URL}/this-page-does-not-exist
    Wait Until Page Contains    Page Not Found    timeout=${STANDARD_WAIT}
    Page Should Contain    Go Home
