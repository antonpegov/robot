*** Settings ***
Documentation       This is a resource file, that can contain variables and keywords.
...                 Keywords defined here can be used where this Keywords.resource in loaded.

# Library    CustomLibrary.py
Library             SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${BROWSER}      chrome
${URL}          http://104.248.166.249


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    React App

Input Username
    [Arguments]    ${username}
    Input Text    id=uname    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=pass    ${password}

Submit Credentials
    Click Button    class=LogIn__buttons__buttonLog

Welcome Page Should Be Open For
    [Arguments]    ${username}
    Wait Until Page Contains Element    class=AccountInfo__username    1s
    Element Should Contain    class=AccountInfo__username    ${username}

Login Should Fail
    ${message}=    Handle Alert    accept
    Should Be Equal    ${message}    Wrong username or password
