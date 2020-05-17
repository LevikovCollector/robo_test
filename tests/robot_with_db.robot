*** Settings ***
Library  SeleniumLibrary
Library  robotpy/AdminProductPage.py

Resource  work_db.robot
Resource  robo_info.robot

Suite Setup     Start
Suite Teardown  Close

*** Keywords ***
Open web browser
   Open browser    ${URL}   ${BROWSER}
   Capture Page Screenshot
Authorization admin
    [Arguments]  ${LOGIN}   ${PASSWORD}
    Capture Page Screenshot
    Input Text      ${LOGIN_FIELD}     ${LOGIN}
    Input Text      ${PASSWORD_FIELD}      ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}

The user can open Product page
    Capture Page Screenshot
    Click Element   ${WINDOW_CLOSE_BUTTON}
    Click Element   ${MENU_CATALOG}
    Set Browser Implicit Wait   5
    Click Element   ${MENU_PRODUCT}
    Element Should Be Visible   ${PRODUCT_TABLE}

User add new product
    Capture Page Screenshot
    [Arguments]  ${PRODUCT_NAME}
    Click Link    ${ADD_NEW_PRODUCT}
    Input Text  ${PRODUCT_NAME_FIELD}   ${PRODUCT_NAME}
    Input Text  ${PRODUCT_DESCRIPTION_FIELD}    description
    Input Text  ${PRODUCT_META_TAG_FIELD}   newtag
    Click Element   ${DATA_TAB}
    Input Text  ${PRODUCT_MODEL}    new model
    Input Text  ${PRODUCT_PRICE}    1000
    Click button    ${SAVE_PRODUCT_BUTTON}
    Element visible in table    ${PRODUCT_NAME}
    Capture Page Screenshot

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

Delete product
    [Arguments]  ${ELEMENT_TEXT}
    Capture Page Screenshot
    ${ROW_COUNT_BEFORE}=       Get Element Count  ${ALL_TABLE_ROWS}
    Log     rows count before: ${ROW_COUNT_BEFORE}
    Check line by text      ${ELEMENT_TEXT}
    Click button        ${DELETE_PRODUCT}
    Alert Should Be Present
    ${ROW_COUNT_AFTER}=       Get Element Count  ${ALL_TABLE_ROWS}
    Log     rows count after: ${ROW_COUNT_AFTER}
    should be true  ${ROW_COUNT_BEFORE}-1 == ${ROW_COUNT_AFTER}
    Capture Page Screenshot

*** Test Cases ***
#The user can add new product
#    Connect to database opencart
#    Open web browser
#    Authorization admin     admin       admin
#    The user can open Product page
#    User add new product    test_product
#    Check product in table  'test_product'
#    Browser close
#    Disconnect

The user can delete product
    Authorization admin     admin       admin
    The user can open Product page
    User add new product    product_for_del
    Delete product      product_for_del
