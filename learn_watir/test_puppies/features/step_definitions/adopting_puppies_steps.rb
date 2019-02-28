Given("I am on the puppy adoption site") do
  visit(HomePage)
end

When("I complete the adoption of a puppy") do
  navigate_all
end

When("I click the View Details button for {string}") do |name|
  on(HomePage).select_puppy name
end

When("I click the Adopt Me button") do
  on(DetailsPage).add_to_cart
end

When("I click the Complete the Adoption button") do
  on(ShoppingCartPage).proceed_to_checkout
end

When("I complete the adoption with:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  on(CheckoutPage).checkout(table.hashes.first)
end

When("I complete the adoption using a Credit card") do
  on(CheckoutPage).checkout('pay_type' => 'Credit card')
end

When("I complete the adoption") do
  on(CheckoutPage).checkout
end

When("I click the Adopt Another Puppy button") do
  on(ShoppingCartPage).continue_shopping
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

Then("I should see {string} as the name for line item {int}") do |name, line_item|
  expect(on(ShoppingCartPage).name_for_line_item(line_item)). to include name
end

Then("I should see {string} as the subtotal for line item {int}") do |subtotal, line_item|
  expect(on(ShoppingCartPage).subtotal_for_line_item(line_item)). to eql subtotal
end

Then("I should see {string} as the cart total") do |total|
  expect(on(ShoppingCartPage).cart_total). to eql total
end

When("I checkout leaving the name field blank") do
  navigate_to(CheckoutPage).checkout('name' => '')
end

Then("I should see the error message {string}") do |msg|
  expect(@current_page).to have_error_message msg #custom RSpec matcher
end

Given("I have a pending adoption for {string}") do |name|
  navigate_to(CheckoutPage).checkout('name' => name)
end

When("I process that pending adoption") do
  visit(LoginPage)
  on(LoginPage).login_with('admin', 'password')
  on(LoginPage).side_menu.adoptions
  on(AdoptionsPage).process_puppy

end

Then("I should see a please thank {string} message") do |customer|
  thank_you_msg = "Please thank #{customer} for the order!"
  expect(@current_page.text).to include thank_you_msg
end
