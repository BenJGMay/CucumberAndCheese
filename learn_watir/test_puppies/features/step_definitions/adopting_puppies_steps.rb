
#def row_for(line_item)
#  (line_item -1) * 6
#end

#def cart_line_item(line_item)
#  @browser.table(index: 0)[row_for(line_item)]
#end

Given("I am on the puppy adoption site") do
  @browser.goto("http://puppies.herokuapp.com/")
end

When("I click the first View Details button") do
  @browser.button(value: "View Details", index: 0).click
end

When("I click the Adopt Me button") do
  @browser.button(value: "Adopt Me!").click
  @cart = ShoppingCartPage.new(@browser)
end

When("I click the Complete the Adoption button") do
  @cart.proceed_to_checkout
end

When("I enter {string} in the name field") do |name|
  @browser.text_field(id: "order_name").set(name)
end

When("I enter {string} in the address field") do |address|
  @browser.textarea(:id => "order_address").set(address)
end

When("I enter {string} in the email field") do |email|
  @browser.text_field(id: 'order_email').set(email)
end

When("I select {string} from the pay with dropdown") do |pay_type|
  @browser.select_list(id: "order_pay_type").select(pay_type)
end

When("I click the Place Order button") do
  @browser.button(value: "Place Order").click
end

Then("I should see {string}") do |expected|
  expect(@browser.text).to include expected
end

When("I click the Adopt Another Puppy button") do
  @cart.continue_shopping
end

When("I click the second View Details button") do
  @browser.button(value: "View Details", index: 1).click
end

Then("I should see {string} as the name for line item {int}") do |name, line_item|
  expect(@cart.name_for_line_item(line_item)). to include name
end

Then("I should see {string} as the subtotal for line item {int}") do |subtotal, line_item|
  expect(@cart.subtotal_for_line_item(line_item)). to eql subtotal
end

Then("I should see {string} as the cart total") do |total|
  expect(@cart.cart_total). to eql total
end
