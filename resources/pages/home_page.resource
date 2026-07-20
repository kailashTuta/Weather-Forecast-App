*** Settings ***
Documentation    Page-object keywords for the Home page (/).
...              Encapsulates all element interactions for the city search form.
Resource         ../variables/common_variables.resource
Library          SeleniumLibrary

*** Keywords ***

Open Home Page
    [Documentation]    Navigate to the Home page and wait for the city input to be visible.
    Go To              ${BASE_URL}/
    Wait Until Element Is Visible    ${CITY_INPUT}    timeout=${STANDARD_WAIT}

Home Page Should Be Loaded
    [Documentation]    Assert that the Home page is displayed by checking the city input field is present.
    Wait Until Element Is Visible    ${CITY_INPUT}    timeout=${STANDARD_WAIT}
    Page Should Contain Element      ${CITY_INPUT}

Enter City Name
    [Documentation]    Clear the city input and type the given city name.
    ...                Parameters:
    ...                - ``city`` — city name to enter
    [Arguments]        ${city}
    Clear Element Text    ${CITY_INPUT}
    Input Text            ${CITY_INPUT}    ${city}

Submit City Form
    [Documentation]    Click the "Get Forecast" submit button to trigger navigation.
    Click Button    ${SUBMIT_BUTTON}

Submit City And Navigate To Forecast
    [Documentation]    Enter a city name and submit the form; wait until the URL contains /forecast.
    ...                Parameters:
    ...                - ``city`` — city name to search
    [Arguments]        ${city}
    Enter City Name    ${city}
    Submit City Form
    Wait Until Location Contains    /forecast    timeout=${STANDARD_WAIT}

City Input Should Be Visible
    [Documentation]    Assert that the city input is visible on the page.
    Element Should Be Visible    ${CITY_INPUT}

City Input Should Be Empty
    [Documentation]    Assert that the city input value is empty.
    Element Attribute Value Should Be    ${CITY_INPUT}    value    ${EMPTY}

Current City Label Should Show
    [Documentation]    Assert the "Current city:" label shows the expected city name.
    ...                Parameters:
    ...                - ``city`` — expected city name
    [Arguments]        ${city}
    Page Should Contain    ${city}
