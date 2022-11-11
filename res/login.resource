*** Settings ***
Library             SeleniumLibrary

*** Variables ***

*** Keywords ***
Open Browser To Login Page
    [Arguments]  ${browser}  ${url}    
    Open Browser  ${url}  ${browser}
    Title Should Be    React App
    

Input Username
    [Arguments]    ${username}
    Input Text    id=uname    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=pass    ${password}

Submit Credentials
    [Arguments]
    Click Button    class=LogIn__buttons__buttonLog

Welcome Page Should Be Open
    [Arguments]    ${username}
    Wait Until Page Contains Element    class=AccountInfo__username    1s
    Element Should Contain    class=AccountInfo__username    ${username}

Login Should Fail
    ${message}=    Handle Alert    accept
    Should Be Equal    ${message}    Wrong username or password
