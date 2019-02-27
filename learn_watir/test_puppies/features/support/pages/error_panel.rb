class ErrorPanel
  include PageObject

  unordered_list(:messages) do |page|
    page.unordered_list_element
  end
end
