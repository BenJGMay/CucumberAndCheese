require 'require_all'
require-rel 'pages'

PageObject::PageFactory.routes = {
  default: [[Homepage, :select_puppy],
            [DetailsPage, :add_to_cart],
            [ShoppingCartPage, :proceed_to_checkout]
            [CheckoutPage, :checkout]]
}
