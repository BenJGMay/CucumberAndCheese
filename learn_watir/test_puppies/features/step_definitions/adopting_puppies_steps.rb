
#def row_for(line_item)
#  (line_item -1) * 6
#end

#def cart_line_item(line_item)
#  @browser.table(index: 0)[row_for(line_item)]
#end

Given("I am on the puppy adoption site") do
  visit(HomePage)
end

When("I click the first View Details button") do
  on(HomePage).select_puppy_number 1
end

When("I click the Adopt Me button") do
  on(DetailsPage).add_to_cart
end

When("I click the Complete the Adoption button") do
  on(ShoppingCartPage).proceed_to_checkout
end

When("I enter {string} in the name field") do |name|
  on(CheckoutPage).name = name
end

When("I enter {string} in the address field") do |address|
  on(CheckoutPage).address = address
end

When("I enter {string} in the email field") do |email|
  on(CheckoutPage).email = email
end

When("I select {string} from the pay with dropdown") do |pay_type|
  on(CheckoutPage).pay_type = pay_type
end

When("I click the Place Order button") do
  on(CheckoutPage).place_order
end

Then("I should see {string}") do |expected|
  expect(@current_page.text).to include expected
end

When("I click the Adopt Another Puppy button") do
  on(ShoppingCartPage).continue_shopping
end

When("I click the second View Details button") do
  on(HomePage).select_puppy_number 2
end

Then("I should see {string} as the name for line item {int}") do |name, line_item|
  expect(@current_page.name_for_line_item(line_item)). to include name
end

Then("I should see {string} as the subtotal for line item {int}") do |subtotal, line_item|
  expect(@cart.subtotal_for_line_item(line_item)). to eql subtotal
end

Then("I should see {string} as the cart total") do |total|
  expect(@cart.cart_total). to eql total
end
