*** Settings ***
Documentation       A test suite with a single test for valid login.
...
...                 This test has a workflow that is created using keywords in
...                 the imported resource file.

Resource            ./res/login.resource


*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    antonpegov@gmail.com
    Input Password    1234qwer
    Submit Credentials
    Welcome Page Should Be Open For    antonpegov@gmail.com
    [Teardown]    Close Browser

Failed Login
    Open Browser To Login Page
    Input Username    qwerty
    Input Password    12345678
    Submit Credentials
    Login Should Fail
    Close Browser
