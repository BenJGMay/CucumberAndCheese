# require 'require_all'
# require_rel 'pages' # adds everything in the pages directory

# We must set a default route, an array of arrays, each of which contains a
# PageObject and a default method to call = we could add parameters if we wanted

PageObject::PageFactory.routes = {
  default: [[HomePage, :select_puppy],
            [DetailsPage, :add_to_cart],
            [ShoppingCartPage, :proceed_to_checkout],
            [CheckoutPage, :checkout]]
}
