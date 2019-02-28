require_relative 'side_menu_panel'

class DetailsPage
  include PageObject

  page_section(:side_menu, SideMenuPanel, id: 'navlist')

  button(:add_to_cart, value: "Adopt Me!")

end
