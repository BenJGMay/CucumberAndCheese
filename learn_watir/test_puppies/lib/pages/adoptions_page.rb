require_relative 'side_menu_panel'

class AdoptionsPage
  include PageObject

  page_section(:side_menu, SideMenuPanel, id: 'navlist')

  button(:process_puppy, value: "Process Puppy")

end
