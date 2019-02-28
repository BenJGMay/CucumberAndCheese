require_relative 'side_menu_panel'

class LoginPage
  include PageObject

  page_section(:side_menu, SideMenuPanel, id: 'navlist')

  page_url "http://puppies.herokuapp.com/login"

  text_field(:username, id: "name")
  text_field(:password, id: "password")
  button(:login, value: "Login")

  def login_with(username='admin', password='password')
    self.username = username
    self.password = password
    login
  end
end
