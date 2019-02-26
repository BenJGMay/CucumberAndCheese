class ErrorPanel
  include PageObject

  unordered_list(:messages) do |page|
    page.error_div_element.unordered_list_element
  end
end
