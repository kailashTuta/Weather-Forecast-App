*** Settings ***
Documentation    Page-object keywords for the Navigation bar component.
...              Encapsulates all navbar element interactions.
Resource         ../variables/common_variables.resource
Library          SeleniumLibrary

*** Keywords ***

Navbar Brand Should Be Visible
    [Documentation]    Assert that the "Weather Forecast" navbar brand link is visible.
    Wait Until Element Is Visible    ${NAVBAR_BRAND}    timeout=${STANDARD_WAIT}

Navbar Brand Should Show Text
    [Documentation]    Assert the navbar brand shows the expected text.
    ...                Parameters:
    ...                - ``text`` — expected brand text (e.g. "Weather Forecast")
    [Arguments]        ${text}
    Element Should Contain    ${NAVBAR_BRAND}    ${text}

Click Navbar Brand
    [Documentation]    Click the "Weather Forecast" navbar brand link to navigate to the Home page.
    Click Element    ${NAVBAR_BRAND}
    Wait Until Location Contains    /    timeout=${STANDARD_WAIT}

Clicking Navbar Brand Navigates To Home
    [Documentation]    Click the navbar brand and assert the URL is the Home page (/).
    Click Navbar Brand
    ${url}=    Get Location
    Should Be Equal    ${url}    ${BASE_URL}/
