*** Settings ***
Library  SeleniumLibrary
Resource  locators.robot

*** Keywords ***
Authorization admin
    [Arguments]  ${LOGIN}   ${PASSWORD}
    Open browser    ${URL}   ${BROWSER}
    Input Text      ${LOGIN_FIELD}     ${LOGIN}
    Input Text      ${PASSWORD_FIELD}      ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}

Faild admin authorization
    Authorization admin     admin123    123456
    Element Should Be Visible    ${FAIL_AUTH_MESSAGE}

The user can open AdminPanel
    Authorization admin     admin   admin
    Title Should Be  Dashboard

The user can open Product page
    Authorization admin    admin   admin
    Click Element   ${WINDOW_CLOSE_BUTTON}
    Click Element   ${MENU_CATALOG}
    Set Browser Implicit Wait   5
    Click Element   ${MENU_PRODUCT}
    Element Should Be Visible   ${PRODUCT_TABLE}

User add new product
    Click Link    ${ADD_NEW_PRODUCT}
    Input Text  ${PRODUCT_NAME_FIELD}   aaa1
    Input Text  ${PRODUCT_DESCRIPTION_FIELD}    description
    Input Text  ${PRODUCT_META_TAG_FIELD}   newtag
    Click Element   ${DATA_TAB}
    Input Text  ${PRODUCT_MODEL}    new model
    Input Text  ${PRODUCT_PRICE}    1000
    Click button    ${SAVE_PRODUCT_BUTTON}
    Element visible in table    aaa1

User edit product
    Click Link  ${EDIT_PRODUCT}
    ${CURRENT_NAME}=    Get Value    ${PRODUCT_NAME_FIELD}
    Input Text  ${PRODUCT_NAME_FIELD}   ${CURRENT_NAME}_edit
    Click button    ${SAVE_PRODUCT_BUTTON}
    Element visible in table    ${CURRENT_NAME}_edit
    Element Should Be Visible   ${MESSAGE_EDIT_SUCCES}


Element visible in table
    [Arguments]     ${element_text}
    Element Should Be Visible   xpath://td[contains(text(), '${element_text}')]

Browser close
    Close Browser

*** Test Cases ***
The admin can`t authorization
    Faild admin authorization
    Browser close

The user can work in AdminPanel
    The user can open AdminPanel
    Browser close

The user can open Product page
    The user can open Product page
    Browser close

The user can add new product
    The user can open Product page
    User add new product
    Browser close

The user can edit product (first product)
    The user can open Product page
    User edit product
    Browser close