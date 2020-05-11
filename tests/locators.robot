*** Variables ***
# Форма авторизации
${URL}           http://localhost/opencart/admin
${BROWSER}      Chrome
${LOGIN_FIELD}  css:#input-username
${PASSWORD_FIELD}   css:#input-password
${LOGIN_BUTTON}     css:div.text-right>button
${FAIL_AUTH_MESSAGE}    css:div.alert.alert-danger.alert-dismissible
# Страница админа
${WINDOW_CLOSE_BUTTON}     css:#modal-security  button.close
${MENU_CATALOG}     css:#menu-catalog  a
# Страница продукта
${MENU_PRODUCT}  css:#menu-catalog> #collapse1 > li:nth-child(2)
${PRODUCT_TABLE}    css:form#form-product
${ADD_NEW_PRODUCT}  css:div.pull-right a[data-original-title='Add New']
${EDIT_PRODUCT}     css:div.table-responsive tbody >tr:nth-child(1)>td:last-child>a
${MESSAGE_EDIT_SUCCES}  css:div.alert.alert-success.alert-dismissible
# Страница создания продукта
${PRODUCT_NAME_FIELD}   css:#form-product #input-name1
${PRODUCT_DESCRIPTION_FIELD}    css:#form-product div.note-editable.panel-body
${PRODUCT_META_TAG_FIELD}   css:#form-product #input-meta-title1
${SAVE_PRODUCT_BUTTON}  css:button[data-original-title='Save']
${DATA_TAB}     css:#form-product ul.nav.nav-tabs > li:nth-child(2)
${PRODUCT_MODEL}    css:#form-product #input-model
${PRODUCT_PRICE}    css:#form-product #input-price

