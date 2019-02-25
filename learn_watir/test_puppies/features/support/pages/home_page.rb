class HomePage
  include PageObject

  page_url "http://puppies.herokuapp.com/"

  def select_puppy_number(num)
    button_element(value: 'View Details', index: num -1).click
  end
end
