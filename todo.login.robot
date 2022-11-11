*** Settings ***
Documentation    A test suite with tests for valid and invalid login.
...                
...        Uses SeleniumLibrary and BrowserLibrary
...        Covers Chrome and Firefox

Resource    ./res/login.resource
Resource    ./res/login.variables.resource

*** Test Cases ***
### Chrome
# VALID LOGIN
Valid Login On Chrome
  Valid login    ${BROWSER[0]}

# INVALID LOGIN
Invalid Login On Chrome
  Invalid login     ${BROWSER[0]}

### Firefox
# VALID LOGIN
Valid Login On Firefox
  Valid login    ${BROWSER[1]}

# INVALID LOGIN
Invalid Login On Firefox
  Invalid login    ${BROWSER[1]}

*** Keywords ***
SELENEUM

Valid Login
  [Arguments]    ${browser}
  Open Browser To Login Page   ${browser}    ${url}
  Input Username    ${USER 1.name}
  Input Password    ${USER 1.password}
  Submit Credentials
  Welcome Page Should Be Open    ${USER 1.name}
  [Teardown]    Close Browser

Invalid Login
  [Arguments]    ${browser}
  Open Browser To Login Page  ${browser}    ${url}
  Input Username    ${USER 2.name}
  Input Password    ${USER 2.password}
  Submit Credentials
  Login Should Fail
  [Teardown]    Close Browser
     