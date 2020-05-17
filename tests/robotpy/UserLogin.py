from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By

class UserLogin:
    def __init__(self, login, password):
        selector = By.CSS_SELECTOR
        login_field = '#input-email'
        password_field = '#input-password'
        login_button = 'div.well>form>input'

        driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
        driver.find_element(selector, login_field).send_keys(login)
        driver.find_element(selector, password_field).send_keys(password)
        driver.find_element(selector, login_button).click()

