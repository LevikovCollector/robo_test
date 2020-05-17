*** Settings ***
Library  SeleniumLibrary
Library  robotpy/mylib.py
Resource  robo_info.robot

Test Teardown  Close browser

*** Keywords ***
Open web browser
    [Arguments]     ${OPEN_URL}
   Open browser    ${OPEN_URL}   ${BROWSER}

Faild admin authorization
    Admin auth     admin123    123456
    Element Should Be Visible    ${FAIL_AUTH_MESSAGE}

Succefulle user auth
    User auth       kallistrat51@yandex.ru      qwe123
    Element Should Be Visible   ${ACCOUNT_BLOCK}

*** Test Cases ***
Check fail admin auth
    open web browser    ${URL}
    Faild admin authorization

Check user auth
    open web browser       http://localhost/opencart/index.php?route=account/login
    Succefulle user auth