from robot.api.deco import keyword
from AdminLogin import AdminLogin
from UserLogin import UserLogin

class mylib():
    @keyword("Admin auth")
    def auth_user_opencart(self, login, password):
        AdminLogin(login, password)

    @keyword("User auth")
    def auth_admin_opencart(self, login, password):
        UserLogin(login, password)