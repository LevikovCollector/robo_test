*** Settings ***
Library  DatabaseLibrary

*** Keywords ***
Connect to database opencart
    connect to database  mysql.connector    opencart     root    qwe123     0.0.0.0     3306

Check product in table
    [Arguments]  ${PRODUCT_NAME}
    @{QResult}  query  SELECT oc_pd.product_id FROM opencart.oc_product_description as oc_pd where oc_pd.name = ${PRODUCT_NAME}
    Log     ${QResult}

Disconnect
    Disconnect From Database
