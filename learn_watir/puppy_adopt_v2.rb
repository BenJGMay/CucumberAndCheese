require 'watir'
require_relative 'adoption_helper'

include AdoptionHelper

@browser = Watir::Browser.new :chrome

go_to_the_puppy_adoption_site()
adopt_puppy_number(1)
checkout_with('Paul', '60 City Road, London', 'testmail@mail.com', 'Credit card')
verify_page_contains('Thank you for adopting a puppy!')
close_the_browser()
