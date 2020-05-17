from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By

class AdminProductPage:
    @keyword("Check line by text")
    def check_line_by_text(self, text):
        ALL_TABLE_LINES = "div.table-responsive tbody >tr"
        COLUMN_PRODUCT_NAME = "td:nth-child(3)"
        COLUMN_WITH_CHECKBOX = "td:nth-child(1)"

        driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
        all_table_elemnts = driver.find_elements(By.CSS_SELECTOR, ALL_TABLE_LINES)
        for element in all_table_elemnts:
            try:
                element_text = element.find_element(By.CSS_SELECTOR, COLUMN_PRODUCT_NAME).text
                if element_text == text:
                    check_box = element.find_element(By.CSS_SELECTOR, COLUMN_WITH_CHECKBOX)
                    check_box.click()

            except AttributeError:
                pass



