require 'watir'
require_relative 'adoption_helper'

include AdoptionHelper

@browser = Watir::Browser.new :chrome

go_to_the_puppy_adoption_site()
adopt_puppy_number(1)
continue_adopting_puppies()
adopt_puppy_number(2)
checkout_with('Test User', '60 City Road, London', 'test@testmail.com', 'Check')
verify_page_contains('Thank you for adopting a puppy!')
close_the_browser()
